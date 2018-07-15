<template>

  <div class="hello">
        <h2> Enter Address </h2>   
        <input type="text" v-model="input.addressId" placeholder="addressId" />
        <br/>
        <input type="text" v-model="input.unitNumber" placeholder="Unit Number" />
        <br />
        
        <input type="text" v-model="input.complexName" placeholder="Complex Name" />
        <br/>
         <button v-on:click="sendData()">Submit Address</button>
         <br />
         <button v-on:click="getData()">Get Addresses</button>
        <br />
        <br />
     <h2> Addresses </h2>   
     <table align = "center">
          <tr>
    <th>addressId</th>
    <th>unitNumber</th>
    <th>complexName</th> 
    
  </tr>
         <tr v-for="address in addresses">
             <td>{{ address.addressId }}</td>
          <td>{{ address.unitNumber }}</td>
          <td>{{ address.complexName }}</td>
    </tr>
    
   
    </table>
      
      

       
    </div>
    
</template>

<script>
import axios from "axios";

export default {
  name: "Address",
  data() {
    return {
      addresses: "",
      input: {
        unitNumber: "",
        complexName: "",
        addressId: "",
      },
      response: ""
    };
  },
  mounted() {
    
    axios({
      method: "GET",
      url: "http://localhost:9090/contact/address/"
    }).then(
      result => {
        this.addresses = result.data;
      },
      error => {
        console.error(error);
      }
    );
  },
  methods: {
    sendData() {
      axios({
        method: "POST",
        url: "http://localhost:9090/contact/address/",
        data: this.input,
        headers: { "content-type": "application/json" }
      }).then(
        result => {
          this.response = result.data;
        },
        error => {
          console.error(error);
        }
      );
    },
    getData() {
    
    axios({
      method: "GET",
      url: "http://localhost:9090/contact/address/"
    }).then(
      result => {
        this.addresses = result.data;
      },
      error => {
        console.error(error);
      }
    );
  }

    
    
  }

  
  
};
</script>

<style scoped>
h1,
h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}

textarea {
  width: 600px;
  height: 200px;
}

table,
th,
td {
  border: 1px solid black;
}
</style>