<template>
  <div class="p-3">
    <h1>{{title}}</h1>
    <TableRender
      :columns="columns"
      :rows="rows"
      :query="queryGet"
			@clickDeleteRow="deleteRow"
      @clickRefresh="getRows()"
      @clickSaverRow="insertUpdateRow"
    ></TableRender>
  </div>
</template>

<script>
const axios = require("axios").default;
import TableRender from "./TableRender.vue";

export default {
  name: "Kutyak",
  components: { TableRender },
  data() {
    return {
      resData: [],
      queryGet: "kutyakTabla",
      queryUpdate: "kutyakUpdate",
      queryInsert: "autoInsert",
      queryDelete: "kutyakDelete",
      title: "",
      columns: {},
      rows: [],
    };
  },
  created() {
    this.getRows();
  },
  methods: {
    getRows() {
      axios
        .get(this.url, {
          params: {
            query: this.queryGet,
          },
        })
        .then((res) => {
          // console.log(res.data);
          this.resData = res.data;
          this.title = this.resData.title;
          this.columns = this.resData.columns;
          this.rows = this.resData.rows;
          console.log(this.resData);
        });
    },
    insertUpdateRow(row) {
			let query = this.queryInsert;
      if (row.kutyaId) {
				query = this.queryUpdate;
			}  
      let params = {
        query: query,
        kutyaId: row.kutyaId,
        nev: row.nev,
        fajtaId: row.fajtaId,
        szuletes: row.szuletes,
        suly: row.suly,
        magassag: row.magassag,
        foto: row.foto,
        ertek: row.ertek
      };
      axios
        .post(this.url, params)
        .then((res) => {
          console.log(res.data);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
    deleteRow(row) {
			let query = this.queryDelete;
       console.log(row);
      let params = {
        query: query,
        kutyaId: row.kutyaId,
      };
      axios
        .post(this.url, params)
        .then((res) => {
          console.log(res.data);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    },
  },
};

</script>

<style>
</style>