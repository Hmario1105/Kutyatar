<template>
<div>
<div>
    <form class="d-flex" @submit.prevent="Search()">
          <input v-model="search"
            class="form-control me-2"
            type="search"
            placeholder="Keresés"
            aria-label="Search"
          />
          <button id="search" class="btn btn-outline-success" type="submit">Keresés</button>
        </form>
  </div>

  <div class="row  row-cols-1 row-cols-md-2 g-4 p-5">
    <div v-for="(row, indexR) in rows" :key="indexR">
      <div class="card" @click="selectRow(row)" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <img :src="getPicture(row.foto)" class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">{{row.nev}}</h5>
          <p class="card-text">            
          </p>
        </div>
      </div>
    </div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">{{selectedRow.nev}}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p><strong>Születése</strong>: {{selectedRow.szuletes}}</p>
        <p><strong>Súlya</strong>: {{selectedRow.suly}}kg</p>
        <p><strong>Magassága</strong>: {{selectedRow.magassag}}cm</p>
        <p><strong>Értéke</strong>: {{selectedRow.ertek}}ft</p>
      </div>
    </div>
  </div>
</div>  
</div>
</div>
</template>

<script>
const axios = require("axios").default;

export default {
  name: "KutyaCard",
  data() {
    return {
      queryGet: "kutyakTabla",
      //   queryUpdate: "KutyakUpdate",
      //   // queryInsert: "autoInsert",
      //   queryDelete: "KutyakDelete",
      title: null,
      columns: [],
      rows: [],
      resData: null,
      selectedRow: [],
      querySearch: "kutyakereses",
      search: ""
    };
  },
  created() {
    this.getRows();
  },
  methods: {
    getRows() {
      //ajax kérés (get)
      axios
        .get(this.url, {
          params: {
            query: this.queryGet,
          },
        })
        .then((res) => {
          this.resData = res.data;
          this.title = this.resData.title;
          this.columns = this.resData.columns;
          this.rows = this.resData.rows;
          console.log("Title:", this.resData);
        })
        .catch((error) => {
          console.log(error);
        });
    },

    Search(){
      axios
        .get(this.url, {
          params: {
            query: this.querySearch,
            search: this.search, 
          },
        })
        .then((res) => {
          this.resData = res.data;
          this.title = this.resData.title;
          this.columns = this.resData.columns;
          this.rows = this.resData.rows;
          console.log("Title:", this.title);
        })
        .catch((error) => {
          console.log(error);
        });
    },


    getPicture(kep) {
      return kep ? require("@/assets/kep/" + kep) : require("@/assets/logo.png");
    },

    selectRow(row){
      console.log(row);
      this.selectedRow = row;
    }
  },
};
</script>

<style>
.card{
  width: 400px;
  cursor: pointer;
}
</style>