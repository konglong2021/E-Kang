<template>
  <div>
    <b-container fluid class="bv-example-row">
      <div class="main-page-content">
        <div class="control-panel">
          <div class="panel-top">
            <div class="content-panel-left">
              <h3 class="head-title">{{$t('content_title_order')}}</h3>
            </div>
            <div class="content-panel-right content-panel-right-full-width" style="vertical-align: text-bottom;">
              <div class="float-right">
                <b-form-select  class="form-control input-content input-select-warehouse min-height-43-px" v-model="warehouse" :options="warehouses" @change="selectedWarehouse(warehouse)"></b-form-select>
              </div>
              <div class="float-right" style="margin-right: 8px; width: 250px;">
                <multiselect class="input-content content-multiple-select"
                             v-model="product_select" :options="productOptions"
                             track-by="name" label="name" :show-labels="false"
                             placeholder="បញ្ចូលឈ្មោះទំនិញស្វែងរក"
                             @select="selectionChange"
                             @remove="removeElement"></multiselect>
<!--                <b-form-select  class="form-control input-content input-select-product" v-model="product_select" :options="productOptions" @change="filterOrderByParam(product_select)"></b-form-select>-->
              </div>
              <div class="float-right" style="margin-right: 8px; display: inline-block;">
                <b-button class="min-height-43-px" v-if="product_select" @click="printFilterData()" size="sm" title="Click to print" variant="success">Click to print</b-button>
              </div>
            </div>
          </div>
        </div>
        <div class="content-product content-order-list">
          <div class="content-loading" v-if="isLoading">
            <div class="spinner-grow text-muted"></div>
          </div>
          <div v-if="!isLoading">
            <div v-if="items">
              <b-table-simple v-if="items.length > 0" class="table-transaction">
                <b-thead class="table-header" style="padding-right: 15px;">
                  <b-tr style="display: inline-block;width: 100%;overflow: hidden;">
                    <b-th class="width-9-percentage" >{{$t('label_date_sale')}}</b-th>
                    <b-th class="width-8-percentage" >{{$t('label_sale_by')}}</b-th>
                    <b-th class="width-10-percentage" >{{$t('label_customer_name')}}</b-th>
                    <b-th class="width-10-percentage" >{{$t('label_number_invoice')}}</b-th>

                    <b-th class="width-10-percentage" >{{$t('label_product_name')}}</b-th>
                    <b-th class="width-5-percentage" >{{$t('label_quantity')}}</b-th>
                    <b-th class="width-9-percentage" >{{$t('label_sale_price')}} ($)</b-th>

                    <b-th class="width-5-percentage" >{{$t('label_discount')}}</b-th>
                    <b-th class="width-5-percentage" >{{$t('label_vat')}}</b-th>
                    <b-th class="width-11-percentage" >{{$t('label_sub_total')}} ($)</b-th>
                    <b-th :class="!product_select ? 'width-9-percentage' : 'width-13-percentage'" >{{$t('label_grand_total')}} ($)</b-th>
                    <b-th class="width-3-percentage" v-show="!product_select">{{$t('title_action')}}</b-th>
                  </b-tr>
                </b-thead>
                <b-tbody class="table-body" :class="product_select ? 'max-height-50-vh' : 'max-height-57-vh'">
                  <b-tr class="table-body-tr" v-for="item in items" v-bind:key="item.order_id">
                    <b-td class="width-9-percentage date content-td" :rowspan="item.lengthDetail">
                      <b class="content">{{ (item.date !== undefined ? item.date : "") }}</b>
                    </b-td>
                    <b-td class="width-8-percentage sale_by content-td" :rowspan="item.lengthDetail">
                      <b class="content">{{ (item.sale_by !== undefined ? item.sale_by : "") }}</b>
                    </b-td>
                    <b-td class="width-10-percentage customer content-td" :rowspan="item.lengthDetail">
                      <b class="content">{{ (item.customer !== undefined ? item.customer : "") }}</b>
                    </b-td>
                    <b-td class="width-10-percentage invoice_id content-td" :rowspan="item.lengthDetail">
                      <b class="content">{{ (item.invoice_id !== undefined ? item.invoice_id : "") }}</b>
                    </b-td>

                    <b-td class="width-10-percentage name content-td">
                      <span class="content">{{ item.name !== undefined ? item.name : "" }}</span>
                    </b-td>
                    <b-td class="width-5-percentage qty content-td">
                      <span class="content">{{ item.qty !== undefined ? item.qty : "" }}</span>
                    </b-td>
                    <b-td class="width-9-percentage sale_price content-td">
                      <span class="content">{{ item.sale_price !== undefined ? item.sale_price + "$" : ""}}</span>
                    </b-td>

                    <b-td class="width-5-percentage discount content-td" :rowspan="item.lengthDetail">
                      <b class="content">{{ (item.discount === 0 || item.discount === undefined) ? "0" : item.discount + "%" }}</b>
                    </b-td>
                    <b-td class="width-5-percentage vat content-td" :rowspan="item.lengthDetail">
                      <b class="content">
                        {{ (item.vat === 0 || item.vat === undefined) ? 0 : item.vat + "%" }}
                      </b>
                    </b-td>
                    <b-td class="width-11-percentage subtotal content-td" :rowspan="item.lengthDetail">
                      <b class="content">{{ item.subtotal !== undefined ? (item.subtotal + "$") : "" }}</b>
                    </b-td>
                    <b-td class="grandtotal content-td" :rowspan="item.lengthDetail" :class="!product_select ? 'width-9-percentage' : 'width-13-percentage'">
                      <b class="content">{{ item.grandtotal !== undefined ? (item.grandtotal + "$") : "" }}</b>
                    </b-td>
                    <b-td class="width-4-percentage content-td" v-show="!product_select" :rowspan="item.lengthDetail">
                      <b-button size="sm" title="Adjust invetory stock" variant="success" @click="UpdateOrder(item)">
                        <i class="fa fa-eye"></i>
                      </b-button>
                    </b-td>
                  </b-tr>
                </b-tbody>
              </b-table-simple>
              <h3 v-if="items.length === 0">មិនមានទិន្នន័យនៃការលក់ទេ</h3>
              <div style="display: inline-block; overflow: hidden; margin-top: 10px; font-weight: bold; float: right; margin-right: 15px;">
                <h5 v-if="product_select">ចំនួនលក់សរុបទាំងអស់ : {{ sumAllSaleProduct(items) }}</h5>
                <h5 v-if="product_select">សរុបទឹកប្រាក់ទាំងអស់ : {{ sumAllPriceSaleProduct(items) + "$"}}</h5>
              </div>
              <div id="table-order" v-if="product_select" style="display: none; width: 100%; overflow: hidden;">
                <h2 style="margin-bottom: 35px;">អំពី ការលក់ </h2>
                <h4 v-if="product_select">ចំនួនលក់សរុបទរបស់ទំនិញាំងអស់ : {{ sumAllSaleProduct(items) }}</h4>
                <h4 v-if="product_select">សរុបទឹកប្រាក់ទាំងអស់ : {{ sumAllPriceSaleProduct(items) + "$"}}</h4>
                <table style="display: inline-block;width: 100%;overflow: hidden;">
                  <thead style="display: inline-block;width: 100%;overflow: hidden; ">
                    <tr style="display: inline-block;width: 100%;overflow: hidden;">
                      <th style="width: 9%; display: inline-block; overflow: hidden;" >{{$t('label_date_sale')}}</th>
                      <th style="width: 8%; display: inline-block; overflow: hidden;" >{{$t('label_sale_by')}}</th>
                      <th style="width: 10%; display: inline-block; overflow: hidden;" >{{$t('label_customer_name')}}</th>
                      <th style="width: 12%; display: inline-block; overflow: hidden;" >{{$t('label_number_invoice')}}</th>

                      <th style="width: 13%; display: inline-block; overflow: hidden;" >{{$t('label_product_name')}}</th>
                      <th style="width: 5%; display: inline-block; overflow: hidden;" >{{$t('label_quantity')}}</th>
                      <th style="width: 9%; display: inline-block; overflow: hidden;" >{{$t('label_sale_price')}} ($)</th>

                      <th style="width: 5%; display: inline-block; overflow: hidden;" >{{$t('label_discount')}}</th>
                      <th style="width: 5%; display: inline-block; overflow: hidden;" >{{$t('label_vat')}}</th>
                      <th style="width: 11%; display: inline-block; overflow: hidden;" >{{$t('label_sub_total')}} ($)</th>
                      <th style="width: 9%; display: inline-block; overflow: hidden;" >{{$t('label_grand_total')}} ($)</th>
                    </tr>
                  </thead>
                  <tbody style="display: inline-block;width: 100%;overflow: hidden;">
                    <tr style="display: inline-block;width: 100%;overflow: hidden; padding-bottom: 15px; padding-top: 5px;" v-for="item in items" v-bind:key="item.order_id">
                      <td style="width: 9%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >{{ (item.date !== undefined ? item.date : "") }}</b>
                      </td>
                      <td style="width: 8%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >{{ (item.sale_by !== undefined ? item.sale_by : "") }}</b>
                      </td>
                      <td style="width: 10%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >{{ (item.customer !== undefined ? item.customer : "") }}</b>
                      </td>
                      <td style="width: 12%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >{{ (item.invoice_id !== undefined ? item.invoice_id : "") }}</b>
                      </td>

                      <td style="width: 13%; display: inline-block; overflow: hidden;" >
                        <span>{{ item.name !== undefined ? item.name : "" }}</span>
                      </td>
                      <td style="width: 5%; display: inline-block; overflow: hidden;" >
                        <span>{{ item.qty !== undefined ? item.qty : "" }}</span>
                      </td>
                      <td style="width: 9%; display: inline-block; overflow: hidden;" >
                        <span >{{ item.sale_price !== undefined ? item.sale_price + "$" : ""}}</span>
                      </td>

                      <td style="width: 5%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >{{ (item.discount === 0 || item.discount === undefined) ? "0" : item.discount + "%" }}</b>
                      </td>
                      <td style="width: 5%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >
                          {{ (item.vat === 0 || item.vat === undefined) ? 0 : item.vat + "%" }}
                        </b>
                      </td>
                      <td style="width: 11%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >{{ item.subtotal !== undefined ? (item.subtotal + "$") : "" }}</b>
                      </td>
                      <td style="width: 9%; display: inline-block; overflow: hidden;" :rowspan="item.lengthDetail">
                        <b >{{ item.grandtotal !== undefined ? (item.grandtotal + "$") : "" }}</b>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <b-modal id="modal-detail-payment" ref="detail-payment-form-modal" size="lg" modal-class="payment-form-modal"
               @hidden="onResetPayment" ok-only ok-variant="secondary" footer-class="justify-content-center"
               @ok="onSubmitPayment" ok-title="ព្រីនចេញ" title="ការលក់" no-close-on-backdrop>
        <b-form enctype="multipart/form-data" style="display: inline-block; width: 100%; height: 100%; overflow: hidden;">
          <div class="full-content margin-bottom-20">
            <div class="container-row-form width-60-percentage float-left">
              <div class="form-row-content-detail row-content-view">
                <label class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">វិក័យប័ត្រលេខ</label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{order.invoice_id}}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-customer'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ឈ្មោះអតិថិជន : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{order.customer}}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">លក់ដោយ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ $store.$cookies.get('user').name }}</strong>
              </div>
            </div>
            <div class="container-row-form width-29-percentage float-right">
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-vat'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ពន្ធ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ order.vat !== 0 ? order.vat + "%": 0 }}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-discount'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">បញ្ចុះតម្លៃ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ order.discount + "%" }}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ថ្ងៃខែឆ្នាំលក់ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ getFullDate() }}</strong>
              </div>
            </div>
          </div>
          <b-table table-class="table-payment"
                   :items="itemsProductDetail"
                   :fields="fieldsProductDetail"
                   stacked="md"
                   show-empty
                   small
          ></b-table>
          <div style="display: inline-block;float: right;margin-top: 25px;">
              <span style="display: block;">{{$t('title_total_in_usd')}} : {{order.subtotal}} USD</span>
              <span style="display: block;margin-top: 10px;">{{$t('title_total_after_vat_in_usd')}} : {{ order.grandtotal}} USD</span>
          </div>
        </b-form>


        <div id="invoice-print-again" style="display: none; width: 100%; height: 100%; overflow: hidden; padding: 30px 30px !important; font-family: 'Arial', 'Khmer OS Bokor', sans-serif !important;">
          <div style="margin-bottom: 30px; font-family: 'Arial', 'Khmer OS Bokor', sans-serif; display:inline-block; width: 100%;">
            <h1 style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif; text-align: center;">{{ $t('title') }}</h1>
          </div>
          <div class="full-content margin-bottom-20">
            <div class="container-row-form width-60-percentage float-left">
              <div class="form-row-content-detail row-content-view">
                <label class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">វិក័យប័ត្រលេខ</label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{order.invoice_id}}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-customer'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ឈ្មោះអតិថិជន : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{order.customer}}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">លក់ដោយ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ $store.$cookies.get('user').name }}</strong>
              </div>
            </div>
            <div class="container-row-form width-29-percentage float-right">
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-vat'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ពន្ធ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ order.vat !== 0 ? order.vat + "%": 0 }}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-discount'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">បញ្ចុះតម្លៃ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ order.discount + "%" }}</strong>
              </div>
              <div class="form-row-content-detail row-content-view">
                <label :for="'input-exchange-rate'" class="label-input no-margin-bottom" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">ថ្ងៃខែឆ្នាំលក់ : </label>
                <strong class="input-content" style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;"> {{ getFullDate() }}</strong>
              </div>
            </div>
          </div>
          <b-table style="font-family: 'Arial', 'Khmer OS Bokor', sans-serif;" table-class="table-payment"
                   :items="itemsProductDetail"
                   :fields="fieldsProductDetail"
                   stacked="md"
                   show-empty
                   small
          ></b-table>
          <div style="display: inline-block;float: right; margin-top: 25px; margin-right: 75px;">
              <span style="display: block; font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{$t('title_total_in_usd')}} : {{order.subtotal}} USD</span>
              <span style="display: block;margin-top: 10px; font-family: 'Arial', 'Khmer OS Bokor', sans-serif;">{{$t('title_total_after_vat_in_usd')}} : {{order.grandtotal}} USD</span>
          </div>
        </div>
      </b-modal>
    </b-container>
  </div>
</template>
<script>

  export default {
    middleware: "local-auth",
    layout:'posui',
    data(){
      return {
        items: [],
        fields: [
          { key: 'sale_by', label: this.$t('label_sale_by')},
          { key: 'customer', label: this.$t('label_customer_name')},
          { key: 'discount', label: this.$t('label_discount')},
          { key: 'vat', label: this.$t('label_vat')},
          { key: 'name', label: this.$t('label_product_name')},
        ],
        itemsProductDetail: [],
        fieldsProductDetail: [
          { key: 'name', label: 'ឈ្មោះទំនិញ', thClass: "header-th", thStyle : "font-size: 17px;"},
          { key: 'qty', label: 'ចំនួន', thClass: "header-th", thStyle : "font-size: 17px;"},
          { key: 'price', label: 'តម្លៃឯកតា ($)', thClass: "header-th", thStyle : "font-size: 17px;"},
          { key: 'total', label: 'តម្លៃសរុប ($)', thClass: "header-th" , thStyle : "font-size: 17px;"},
          { key: 'discount', label: 'បញ្ចុះតម្លៃ (%)', thClass: "header-th", thStyle : "font-size: 17px;"},
          { key: 'total_after_discount', label: 'តម្លៃសរុប បន្ទាប់ពី បញ្ចុះតម្លៃ ($)', thClass: "header-th", thStyle : "font-size: 17px;"},
        ],
        warehouses : [{text : "ជ្រើសរើស ឃ្លាំងទំនិញ", value : null}],
        warehouse: null,
        products : [],
        isLoading: false,
        customers: [],
        customersList: [],
        optionStyleHtmlToPaper: {
          specs: [
            'fullscreen=yes',
            'titlebar=yes',
            'scrollbars=yes'
          ],
          styles: [
            'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css',
            'https://unpkg.com/kidlat-css/css/kidlat.css',
            // '~/static/css/app.css',
          ],
          autoClose: true,
        },
        orderList: [],
        order: {
          customer: null,
          vat: 0,
          discount: 0,
          invoice_id: null
        },
        product_select: null,
        productOptions : []
      }
    },
    methods: {
      async getListProduct($warehouse){
        let vm = this;
        vm.products = [];

        await vm.$axios.get('/api/stock').then(function (response) {
          if(response && response.hasOwnProperty("data")){
            let dataResponse = response.data;
            if(dataResponse && dataResponse.length > 0){
              vm.totalRows = response.data.length;
              for(let i=0; i < dataResponse.length; i++){
                let productList = dataResponse[i].product;
                if(productList && productList.length > 0){
                  for(let index=0; index < productList.length; index++){
                    let productItem =  { id: '', name: null, price : 0, currency:'USD', img :'', code : null};
                    productItem.id = productList[index].id;
                    productItem.en_name = productList[index].en_name;
                    productItem.kh_name = productList[index].kh_name;
                    productItem.name = productList[index].en_name + " (" + productList[index].kh_name + ")";
                    productItem.price = productList[index].sale_price;
                    productItem.img = productList[index].image !== "no image" ? vm.generateImageUrlDisplay(productList[index].image) : productList[index].image;
                    productItem.code = productList[index].code;
                    vm.products.push(productItem);
                  }
                }
                else if(productList && productList.hasOwnProperty("id")){
                  let productItem =  { id: '', name: null, price : 0, currency:'USD', img :'', code : null};
                  productItem.id = productList.id;
                  productItem.name = productList.en_name + " (" + productList.kh_name + ")";
                  productItem.en_name = productList.en_name;
                  productItem.kh_name = productList.kh_name;
                  productItem.price = productList.sale_price;
                  productItem.img = (productList.image !== "no image" && productList.image !== "no image created") ? vm.generateImageUrlDisplay(productList.image) : productList.image;
                  productItem.code = productList.code;
                  vm.products.push(productItem);
                  vm.productOptions.push({name: productItem.name, value: productItem.id})
                }
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          vm.$toast.error("getting data error ").goAway(2000);
        });
      },
      async getCustomerList(){
        let self = this;
        await self.$axios.get('/api/customer').then(function (response) {
          if(response.hasOwnProperty("data") && response.data.hasOwnProperty("customer")){
            self.customersList = self.cloneObject(response.data.customer);
            for(let index=0; index < response.data.customer.length; index++){
              self.customers.push({text : response.data.customer[index]["name"], value : response.data.customer[index]["id"]});
            }
          }
        })
          .catch(function (error) {
            self.$toast.error("getting data error ").goAway(2000);
            console.log(error);
          });
      },
      async getWareHouseList(){
        let self = this;
        await self.$axios.get('/api/warehouse').then(function (response) {
          if(response.data.hasOwnProperty("data")){
            for(let index=0; index < response.data.data.length; index++){
              self.warehouses.push({text : response.data.data[index]["name"], value : response.data.data[index]["id"]});
            }
          }
        })
          .catch(function (error) {
            self.$toast.error("getting data error ").goAway(2000);
            console.log(error);
          });
      },
      async getAllOrderData(){
        let self = this;
        self.isLoading = true;
        self.items = [];

        await self.$axios.get('/api/sale').then(function (response) {
          self.isLoading = false;
          if(response && response.hasOwnProperty("data")){
            self.orders = response.data;
            self.orderList = self.cloneObject(response.data);
            let itemOrder = [];
            if(self.orders.length > 0){
              for(let indexOrder =0; indexOrder < self.orders.length; indexOrder++){
                let orderItem = self.orders[indexOrder];
                let customerItem = self.filterDataCustomerList(orderItem.customer_id);
                let user = self.cloneObject(self.$store.$cookies.get('user'));
                itemOrder[orderItem.id] = [];

                if(orderItem.hasOwnProperty("orderdetails") && orderItem.orderdetails.length > 0){
                  for(let indexOrderDetail =0; indexOrderDetail < orderItem.orderdetails.length; indexOrderDetail++){
                    let itemOrderDetail = [];
                    let orderDetailItem = orderItem.orderdetails[indexOrderDetail];
                    let productData = self.filterProduct(orderDetailItem.product_id);
                    if(productData !== null && productData !== undefined){
                      let createdDate = new Date(orderDetailItem.created_at);
                      let dd = createdDate.getDate();
                      let mm = createdDate.getMonth() + 1;
                      let day = (dd < 10) ? ('0' + dd) : dd;
                      let month = (mm < 10) ? ('0' + mm) : mm;
                      let yyyy = createdDate.getFullYear();
                      itemOrderDetail["date"] = (day + "/" + month + "/" + yyyy);
                      itemOrderDetail["name"] = productData["en_name"] + " (" + productData["kh_name"] + ")";
                      itemOrderDetail["en_name"] = productData["en_name"];
                      itemOrderDetail["kh_name"] = productData["kh_name"] ;
                      itemOrderDetail["product_id"] = productData["id"] ;
                      itemOrderDetail["qty"] = parseInt(orderDetailItem.quantity);
                      itemOrderDetail["sale_price"] = productData["price"] ;
                      itemOrderDetail["order_id"] =orderDetailItem.order_id;
                      itemOrder[orderItem.id].push(itemOrderDetail);
                    }
                  }
                }
                for(let index=0; index < itemOrder[orderItem.id].length; index++){
                  let itemData = [];
                  if(index === 0){
                    itemData["order_id"] = orderItem.id;
                    itemData["sale_by"] = user.name;
                    if(customerItem){
                      itemData["customer"] = customerItem["name"];
                    }
                    itemData["invoice_id"] = orderItem["invoice_id"];
                    itemData["discount"] = (orderItem["discount"] > 0 ? orderItem["discount"] : 0);
                    itemData["vat"] = ((orderItem.hasOwnProperty("vat") && orderItem["vat"] > 0) ? (orderItem["vat"] * 100) : 0);
                    itemData["lengthDetail"] = itemOrder[orderItem.id].length;
                    itemData["subtotal"] = orderItem["subtotal"];
                    itemData["grandtotal"] = orderItem["grandtotal"];

                    itemData["product_id"] = itemOrder[orderItem.id][index].product_id;
                    itemData["name"] = itemOrder[orderItem.id][index].name;
                    itemData["qty"] = itemOrder[orderItem.id][index]["qty"];
                    itemData["sale_price"] = itemOrder[orderItem.id][index]["sale_price"];
                    itemData["date"] = itemOrder[orderItem.id][index]["date"];
                  }
                  else {
                    itemData["product_id"] = itemOrder[orderItem.id][index].product_id;
                    itemData["name"] = itemOrder[orderItem.id][index].name;
                    itemData["qty"] = itemOrder[orderItem.id][index]["qty"];
                    itemData["sale_price"] = itemOrder[orderItem.id][index]["sale_price"];
                  }
                  self.items.push(itemData);
                }
              }
            }
          }
        }).catch(function (error) {
          console.log(error);
          self.$toast.error("getting data error ").goAway(2000);
        });
      },

      filterDataCustomerList(itemId){
        if(this.customersList && this.customersList.length > 0){
          for(let index=0; index < this.customersList.length; index++){
            if(itemId === this.customersList[index].id){
              return this.customersList[index];
            }
          }
        }
      },
      selectedWarehouse(warehouse){
        this.$emit('selectWarehouse', warehouse);
        if(warehouse){
          this.getListProduct(warehouse);
        }
      },
      generateImageUrlDisplay(img){
        if (typeof window !== "undefined") {
          if((img !== "no image" && img !== "no image created")){
            return (window.location.protocol + "//" + window.location.hostname + ":8000/" + "storage/img/" + img) ;
          }
        }
      },
      cloneObject(obj) {
        return JSON.parse(JSON.stringify(obj));
      },
      UpdateOrder(item){
        this.order = item;
        console.log(item);
        this.itemsProductDetail = [];
        let discount = 0;
        let orderDetailList = [];
        let orderDetailArray = [];

        if(this.orderList.length > 0){
          for(let index =0; index < this.orderList.length; index++){
            if(this.orderList[index]["id"] === item.order_id){
              discount = item.discount;
              orderDetailList = this.cloneObject(this.orderList[index]["orderdetails"]);
              break;
            }
          }
          if(orderDetailList && orderDetailList.length > 0){
            for(let indexOrder = 0; indexOrder < orderDetailList.length; indexOrder++){
              let productIdSelected = orderDetailList[indexOrder]["product_id"];
              let data = {};
              let productItem = null;

              if(this.products && this.products.length > 0){
                for(let k=0; k < this.products.length; k++){
                  if(productIdSelected === this.products[k].id){
                    productItem = this.cloneObject(this.products[k]);
                    break;
                  }
                }
              }
              if(productItem){
                data["name"] = productItem["name"];
                data["qty"] = parseInt(orderDetailList[indexOrder]["quantity"]);
                data["price"] = orderDetailList[indexOrder]["sellprice"];
                let total = (parseFloat(orderDetailList[indexOrder]["sellprice"]) * parseInt(orderDetailList[indexOrder]["quantity"]));
                data["total"] = total;
                data["discount"] = discount > 0 ? (discount) : 0;
                data["total_after_discount"] = total - (total * (discount / 100));
                orderDetailArray.push(data);
              }
            }
          }
          this.itemsProductDetail = this.cloneObject(orderDetailArray);
        }
        this.$refs["detail-payment-form-modal"].show();
      },
      filterProduct(product_id){
        if(this.products && this.products.length > 0){
          for(let index=0; index < this.products.length; index++){
            if(product_id === this.products[index].id){
              return this.products[index];
            }
          }
        }
      },
      getFullDate(){
        let today = new Date();
        let dd = today.getDate();
        let mm = (today.getMonth() + 1); //January is 0!
        let day = (dd < 10) ? ("0" + dd) : dd;
        let month = (mm < 10) ? ("0" + mm) : mm;
        let yyyy = today.getFullYear();

        return (day + "/" + month + "/" + yyyy);
      },
      onResetPayment(){},
      onSubmitPayment(){
        this.$htmlToPaper("invoice-print-again", this.optionStyleHtmlToPaper);
      },
      filterOrderByParam($paramProductId){
        let orders = [];
        let user = this.cloneObject(this.$store.$cookies.get('user'));

        if($paramProductId){
          if(this.orders && this.orders.length > 0){
            for (let index=0; index < this.orders.length; index++){
              let orderItem = {};
              let orderItemDetailData = this.filterOrderDetailData(this.orders[index], $paramProductId);
              if(orderItemDetailData && orderItemDetailData.hasOwnProperty("product_id")){
                orderItem["customer"] = this.orders[index]["customers"]["name"];
                orderItem["invoice_id"] = this.orders[index]["invoice_id"];

                orderItem["discount"] = this.orders[index]["discount"];
                orderItem["vat"] = this.orders[index]["vat"];
                orderItem["sale_by"] = user.name;

                let createdDate = new Date(this.orders[index]["created_at"]);
                let dd = createdDate.getDate();
                let mm = createdDate.getMonth() + 1;
                let day = (dd < 10) ? ('0' + dd) : dd;
                let month = (mm < 10) ? ('0' + mm) : mm;
                let yyyy = createdDate.getFullYear();
                orderItem["date"] = (day + "/" + month + "/" + yyyy);

                orderItem["product_id"] = orderItemDetailData["product_id"];
                orderItem["name"] = orderItemDetailData["name"];
                orderItem["sale_price"] = orderItemDetailData["sale_price"];
                orderItem["qty"] = orderItemDetailData["qty"];
                orderItem["subtotal"] = (parseFloat(orderItemDetailData["sale_price"]) * orderItemDetailData["qty"]);
                orderItem["grandtotal"] = (parseFloat(orderItem["subtotal"]) - (parseFloat(orderItem["subtotal"]) * (parseInt(orderItem["discount"]) / 100)));
                orders.push(orderItem);
              }
            }
          }
          this.items = this.cloneObject(orders);
        }
        else {
          this.getAllOrderData();
        }

      },
      filterOrderDetailData(orderItem, $paramProductId){
        let orderDetailItemTemp = {};
          if(orderItem.hasOwnProperty("orderdetails") && orderItem["orderdetails"].length > 0){
              for(let indexOrderDetail =0; indexOrderDetail < orderItem["orderdetails"].length; indexOrderDetail++){
                  let orderDetailItem = orderItem["orderdetails"][indexOrderDetail];
                  if($paramProductId === orderDetailItem["product_id"]){
                      let product = this.filterProduct($paramProductId);
                      orderDetailItemTemp["product_id"] = $paramProductId;
                      orderDetailItemTemp["name"] = product["name"];
                      orderDetailItemTemp["sale_price"] = orderDetailItem["sellprice"];
                      orderDetailItemTemp["qty"] = parseInt(orderDetailItem["quantity"]);
                  }
              }
          }

          return orderDetailItemTemp;
      },
      sumAllSaleProduct($data){
          let total = [];
          Object.entries($data).forEach(([key, val]) => {
              total.push(val.qty);
          });
          return total.reduce(function(total, num){ return total + num }, 0);
      },
      sumAllPriceSaleProduct($data){
        let total = [];
        Object.entries($data).forEach(([key, val]) => {
          total.push(parseFloat(val.grandtotal));
        });
        return total.reduce(function(total, num){ return total + num }, 0);
      },
      printFilterData(){
        this.$htmlToPaper("table-order", this.optionStyleHtmlToPaper);
      },
      selectionChange($obj){
        let orders = [];
        let user = this.cloneObject(this.$store.$cookies.get('user'));

        if($obj){
          if(this.orders && this.orders.length > 0){
            for (let index=0; index < this.orders.length; index++){
              let orderItem = {};
              let orderItemDetailData = this.filterOrderDetailData(this.orders[index], $obj["value"]);
              if(orderItemDetailData && orderItemDetailData.hasOwnProperty("product_id")){
                orderItem["customer"] = this.orders[index]["customers"]["name"];
                orderItem["invoice_id"] = this.orders[index]["invoice_id"];

                orderItem["discount"] = this.orders[index]["discount"];
                orderItem["vat"] = this.orders[index]["vat"];
                orderItem["sale_by"] = user.name;

                let createdDate = new Date(this.orders[index]["created_at"]);
                let dd = createdDate.getDate();
                let mm = createdDate.getMonth() + 1;
                let day = (dd < 10) ? ('0' + dd) : dd;
                let month = (mm < 10) ? ('0' + mm) : mm;
                let yyyy = createdDate.getFullYear();
                orderItem["date"] = (day + "/" + month + "/" + yyyy);

                orderItem["product_id"] = orderItemDetailData["product_id"];
                orderItem["name"] = orderItemDetailData["name"];
                orderItem["sale_price"] = orderItemDetailData["sale_price"];
                orderItem["qty"] = orderItemDetailData["qty"];
                orderItem["subtotal"] = (parseFloat(orderItemDetailData["sale_price"]) * orderItemDetailData["qty"]);
                orderItem["grandtotal"] = (parseFloat(orderItem["subtotal"]) - (parseFloat(orderItem["subtotal"]) * (parseInt(orderItem["discount"]) / 100)));
                orders.push(orderItem);
              }
            }
          }
          this.items = this.cloneObject(orders);
        }
        else {
          this.getAllOrderData();
        }
        this.$forceUpdate();
      },
      removeElement($obj){
        this.$forceUpdate();
      },
    },
    mounted() {
      this.warehouse = this.$store.$cookies.get('storeItem');
      if(this.$store.$cookies.get('storeItem')){
        this.getListProduct(this.$store.$cookies.get('storeItem'));
      }
      this.getCustomerList();
      this.getWareHouseList();
      this.getAllOrderData();
    }
  }
</script>

<style scoped>
  .content-order-list{
    min-height: calc(100vh - 140px);
  }
  .table-transaction{
    display: inline-block;
    width: 100%;
    overflow: hidden;
    height: 100%;
  }
  .table-transaction .table-header{
    display:inline-block;
    overflow: hidden;
    width: 100%;
  }
  .table-transaction .table-header tr th{
    border-bottom: 1px solid #dee2e6;
    vertical-align: top;
    text-align: left;
  }

  .table-transaction .table-body{
    display: inline-block;
    overflow-y: scroll;
    width: 100%;
  }
  .max-height-50-vh{
    max-height: 50vh;
  }
  .max-height-57-vh{
    max-height: 57vh;
  }
  .table-transaction .table-body .table-body-tr{
    display: inline-block;
    width: 100%;
    overflow: hidden;
    border-bottom: 1px solid #dee2e6;
  }
  .table-transaction .table-body .table-body-tr .content-td{
    display: inline-block;
    overflow: hidden;
    border-bottom: none;
    border-top: none;
  }

  .style-content{
    display: inline-block;
    overflow: hidden;
    border-bottom: none;
    border-top: none;
    text-align: left;
  }
  .content{
    display: inline-block;
    overflow:hidden;
    width: 100%;
  }
</style>
