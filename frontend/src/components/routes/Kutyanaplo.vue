<template>
  <div class="p-3">
    <h1>Kutyanapló</h1>
    <div>
      <div class="table-responsive">
        <table class="table table-striped my-table-fit table-sm">
          <thead class="table-dark">
            <tr>
              <!-- vezérlők -->
              <th class="my-insert-button-width my-td-button">
                <!-- frissítés -->
                <!-- Látható: mindíg -->
                <button
                  type="button"
                  class="btn btn-outline-light btn-sm my-p-button"
                  @click="rowsRefresh()"
                >
                  <i class="bi bi-arrow-counterclockwise"></i>
                </button>

                <!-- insert: sor Hozzáfűzés -> insert  -->
                <!-- Látható: read -->
                <button
                  type="button"
                  class="btn btn-success btn-sm my-p-button"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                  @click="insertOnclicked()"
                >
                  <i class="bi bi-plus"></i>
                </button>
              </th>

              <th
                v-for="(th, thKey, indexH) in columns"
                :key="indexH"
                :class="{ 'd-none': indexH == 0 }"
              >
                {{ th }}
              </th>
            </tr>
          </thead>

          <tbody>
            <tr v-for="(row, indexR) in rows" :key="indexR">
              <!-- Vezérlők -->
              <td class="my-td-button">
                <!-- update: adatmódosítás üzemmódba lépés: -> update  -->
                <button
                  type="button"
                  class="btn btn-outline-primary btn-sm my-p-button"
                  @click="updateOnclicked(indexR)"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                >
                  <i class="bi bi-brush-fill"></i>
                </button>

                <!-- Delete Törlés: ->  -->
                <button
                  type="button"
                  class="btn btn-outline-danger btn-sm my-p-button"
                  @click="deleteOnclicked(indexR)"
                >
                  <i class="bi bi-trash"></i>
                </button>
              </td>

              <td
                v-for="(cell, cellKey, indexTd) in row"
                :key="indexTd"
                :class="{ 'd-none': indexTd == 0 }"
              >
                {{
                  indexTd == 1
                    ? listKutyak.find((kutya) => kutya.kutyaId == cell).nev
                    : indexTd == 3
                    ? listEsemenyek.find((es) => es.esemenyId == cell).esemeny
                    : cell
                }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Modal -->
      <div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <form class="needs-validation">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Kutyanapló</h5>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                  @click="cancelOnClicked"
                ></button>
              </div>
              <div class="modal-body">
                <h1>{{ statusTitle }}</h1>

                <div class="row mb-3">
                  <div class="col-5">
                    <label for="berletKezdete" class="form-label"
                      >Esemény</label
                    >
                    <input
                      v-model="rowBuffer.datum"
                      type="date"
                      class="form-control"
                      id="berletKezdete"
                      required
                    />
                    <div class="invalid-feedback">
                      A helyes formátumú dátum kötelező.
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-6">
                    <label for="esemeny" class="form-label">Esemény</label>
                    <ComboRender
                      :id="'esemeny'"
                      :list="listEsemenyek"
                      :defaultValue="rowBuffer.esemenyId"
                      @onChangeCombo="onChangeEsemenyek"
                    ></ComboRender>
                  </div>
                  <div class="col-6">
                    <label for="kutya" class="form-label">Kutya</label>
                    <ComboRender
                      :id="'kutya'"
                      :list="listKutyak"
                      :defaultValue="rowBuffer.kutyaId"
                      @onChangeCombo="onChangeKutyak"
                    ></ComboRender>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                  @click="cancelOnClicked"
                >
                  Mégse
                </button>
                <button
                  type="button"
                  class="btn btn-primary"
                  data-bs-dismiss="modal"
                  @click.stop.prevent="postKutyanaplo"
                >
                  Mentés
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
const axios = require("axios").default;
import ComboRender from "./ComboRender.vue";

export default {
  name: "Kutyanaplo",
  components: { ComboRender },
  data() {
    return {
      resData: [],
      // queryGet: "kutyanaploTabla",
      // queryUpdate: "kutyanaploUpdate",
      // queryInsert: "kutyanaploInsert",
      // queryDelete: "kutyanaploDelete",
      listKutyak: [],
      listEsemenyek: [],
      statusTitle: "",
      status: "read",
      columns: {},
      rows: [],
      selectedRowIndex: null,
      rowBuffer: null,
    };
  },
  created() {
    this.getCommboKutyaList();
    this.getCommboEsemenyList();
    this.getKutyanaplo();
    this.rowBuffer = this.getRowNull();
  },
  methods: {
    getRowNull() {
      let row = { ...this.rows[0] };
      for (const key in row) {
        row[key] = null;
      }
      return row;
    },

    deleteKutyanaplo() {
      let answer = window.confirm("Valóban törölni akarja?");
      if (answer) {
        let params = {
          query: "kutyanaploDelete",
          kutyaNaploId: this.rows[this.selectedRowIndex].kutyaNaploId,
        };
        axios
          .post(this.url, params)
          .then((res) => {
            //todo: éalksdjfélkaj
            console.log(res.data);
          })
          .catch(function (error) {
            // handle error
            console.log(error);
          })
          .then(() => {
            this.getKutyanaplo();
            this.status = "read";
          });
      }
    },
    postKutyanaplo() {
      console.log("postKutyanaplo");
      console.log(this.rowBuffer);
      console.log(this.rowBuffer.kutyaNaploId);
      console.log(this.rowBuffer.kutyaId);
      console.log(this.rowBuffer.datum);
      console.log(this.rowBuffer.esemenyId);
      let query = "kutyanaploInsert";
      if (this.rowBuffer.kutyaNaploId) {
        query = "kutyaNaploUpdate";
      }
      let params = {
        query: query,
        kutyaNaploId: this.rowBuffer.kutyaNaploId,
        kutyaId: this.rowBuffer.kutyaId,
        datum: this.rowBuffer.datum,
        esemenyId: this.rowBuffer.esemenyId,
      };
      axios
        .post(this.url, params)
        .then((res) => {
          console.log(res.data);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        })
        .then(() => {
          this.getKutyanaplo();
          this.status = "read";
        });
    },

    getKutyanaplo() {
      axios
        .get(this.url, {
          params: {
            query: "kutyanaploTabla",
          },
        })
        .then((res) => {
          this.rows = res.data.rows;
          this.columns = res.data.columns;
          // console.log(this.rowsKolcsonzesOsszes);
          this.rowBuffer = this.getRowNull();
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
    getCommboKutyaList() {
      let query = "kutyakTabla";
      axios
        .get(this.url, {
          params: {
            query: query,
          },
        })
        .then((res) => {
          this.resData = res.data;
          this.listKutyak = this.resData.rows;
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
    getCommboEsemenyList() {
      axios
        .get(this.url, {
          params: {
            query: "esemenyekTabla",
          },
        })
        .then((res) => {
          this.resData = res.data;
          this.listEsemenyek = this.resData.rows;
          // console.log(this.listBerlok);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
    onChangeKutyak(id) {
      console.log("kutyaId:", id);
      this.rowBuffer.kutyaId = id;
    },
    onChangeEsemenyek(id) {
      console.log("esemenyId:", id);
      this.rowBuffer.esemenyId = id;
    },
    insertOnclicked() {
      this.status = "insert";
      this.statusTitle = "Új bejegyzés";
      this.rowBuffer = this.getRowNull();
      this.getCommboKutyaList();
    },
    updateOnclicked(index) {
      this.selectedRowIndex = index;
      this.status = "update";
      this.statusTitle = "Módosítás";
      this.getCommboKutyaList();
      this.rowBuffer = { ...this.rows[this.selectedRowIndex] };
      // this.rowBuffer = this.rowsKolcsonzesOsszes[this.selectedRowIndex];
    },
    cancelOnClicked() {
      this.status = "read";
    },
    deleteOnclicked(index) {
      this.selectedRowIndex = index;
      this.status = "delete";
      this.deleteKutyanaplo();
    },
    rowsRefresh() {
      this.getKutyanaplo();
    },
  },
};
</script>

<style>
</style>