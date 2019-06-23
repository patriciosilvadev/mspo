exports.queryAllCustomers = function (body, cb) {
  process.nextTick(function () {
    var firstquery = "SELECT * FROM `customers` WHERE 1 ORDER BY custId";
    con.query(firstquery, function (err, result, fields) {
      if (result) result = JSON.parse(JSON.stringify(result));
      if (result && result.length) {
        return cb(null, result);
      }
      else {
        return cb(err, null);
      }
    });
  });
}

exports.queryCustomers = function (custid, cb) {
  process.nextTick(function () {
    var firstquery = `SELECT * FROM customers WHERE 1 and custId=${custid} ORDER BY custId`;
    con.query(firstquery, function (err, result, fields) {
      console.log(result);
      if (result) result = JSON.parse(JSON.stringify(result));
      if (result && result.length) {
        return cb(null, result);
      }
      else {
        return cb(err, null);
      }
    });
  });
}

exports.createCustomer = function (cust, cb) {
  process.nextTick(function () {

    cust.custno = cust.custno ? [].concat(cust.custno) : [''];
    cust.custname = cust.custname ? [].concat(cust.custname) : [''];
    cust.custic = cust.custic ? [].concat(cust.custic) : [''];
    cust.custtel = cust.custtel ? [].concat(cust.custtel) : [''];
    cust.custadd1 = cust.custadd1 ? [].concat(cust.custadd1) : [''];
    cust.custadd2 = cust.custadd2 ? [].concat(cust.custadd2) : [''];
    cust.custadd3 = cust.custadd3 ? [].concat(cust.custadd3) : [''];
    

    let firstquery = "INSERT INTO `customers` (`custNo`, `custName`, `custIC`, `custTel`, `custAdd1`, `custAdd2`, `custAdd3`, `deactivated`, `createDate`) VALUES ("
      + "'" + cust.custno[0] + "',"
      + "'" + cust.custname[0] + "',"
      + "'" + cust.custic[0] + "',"
      + "'" + cust.custtel[0] + "',"
      + "'" + cust.custadd1[0] + "',"
      + "'" + cust.custadd2[0] + "',"
      + "'" + cust.custadd3[0] + "',"            
      + "'" + "0" + "',"
      + "" + "CURRENT_TIMESTAMP"
      + ")";
    con.query(firstquery, function (err, result, fields) {
      if (result) result = JSON.parse(JSON.stringify(result));
      if (result && result.insertId) {
        return cb(null, result);
      }
      else {
        return cb(err, null);
      }
    });
  });
}


exports.editCustomer = function (cust, cb) {
  process.nextTick(function () {

    cust.custid = cust.custid ? [].concat(cust.custid) : [''];
    cust.custno = cust.custno ? [].concat(cust.custno) : [''];
    cust.custname = cust.custname ? [].concat(cust.custname) : [''];
    cust.custic = cust.custic ? [].concat(cust.custic) : [''];
    cust.custtel = cust.custtel ? [].concat(cust.custtel) : [''];
    cust.custadd1 = cust.custadd1 ? [].concat(cust.custadd1) : [''];
    cust.custadd2 = cust.custadd2 ? [].concat(cust.custadd2) : [''];
    cust.custadd3 = cust.custadd3 ? [].concat(cust.custadd3) : [''];
    

    let firstquery = "UPDATE `customers` SET"
      + "`custNo` = '" + cust.custno[0] + "',"
      + "`custName` ='" + cust.custname[0] + "',"
      + "`custIC` = '" + cust.custic[0] + "',"
      + "`custTel` = '" + cust.custtel[0] + "',"
      + "`custAdd1` = '" + cust.custadd1[0] + "',"
      + "`custAdd2` = '" + cust.custadd2[0] + "',"
      + "`custAdd3` = '" + cust.custadd3[0] + "'"            
      + " where custId=" + cust.custid[0];

    con.query(firstquery, function (err, result, fields) {
      if (result) result = JSON.parse(JSON.stringify(result));
      //console.log(result);
      if (result) {
        return cb(null, result);
      }
      else {
        return cb(err, null);
      }
    });
  });
}
function addescape(str) {
  var strconv = '';
  strconv = str;
  if (typeof strconv === 'string') {
    strconv = strconv.replace("'", "''");
  }
  return strconv;
} 