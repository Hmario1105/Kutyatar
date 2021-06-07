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
  name: "Esemenyek",
  components: { TableRender },
  data() {
    return {
      resData: [],
      queryGet: "esemenyekTabla",
      queryUpdate: "esemenyekUpdate",
      queryInsert: "esemenyekInsert",
      queryDelete: "esemenyekDelete",
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
      if (row.esemenyId) {
				query = this.queryUpdate;
			}  
      let params = {
        query: query,
        esemenyId: row.esemenyId,
        esemeny: row.esemeny
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
        esemenyId: row.esemenyId,
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