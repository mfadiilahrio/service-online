<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Service Online Admin</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?= base_url('assets/plugins/fontawesome-free/css/all.min.css'); ?>">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?= base_url('assets/dist/css/adminlte.min.css'); ?>">
</head>
<body>
<div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-12">
        <h4>
          <i class="fas fa-globe"></i> Service Online
          <small class="float-right">Tanggal: <?= $record->created_at ?></small>
        </h4>
      </div>
      <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
      <div class="col-sm-4 invoice-col">
        Dari
        <address>
          <strong>Admin, Inc.</strong><br>
          795 Folsom Ave, Suite 600<br>
          San Francisco, CA 94107<br>
          Phone: (804) 123-5432<br>
          Email: info@almasaeedstudio.com
        </address>
      </div>
      <!-- /.col -->
      <div class="col-sm-4 invoice-col">
        Kepada
        <address>
          <strong><?= $this->session->userdata('name') ?></strong><br>
          <?= $record->address ?><br>
          <?= $record->postal_code ?><br>
          Phone: <?= $this->session->userdata('phone') ?><br>
          Email: <?= $this->session->userdata('email') ?>
        </address>
      </div>
      <!-- /.col -->
      <div class="col-sm-4 invoice-col">
        <b>Invoice ID <?= $record->id ?></b><br>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
      <div class="col-12 table-responsive">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>Nama produk</th>
              <th>Harga</th>
              <th>Qty</th>
              <th>Subtotal</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($records as $booking_item) : ?>
            <tr>
              <td><?= $booking_item->name ?></td>
              <td><?= 'Rp. '.number_format($booking_item->price, 0, ",", ".") ?></td>
              <td><?= $booking_item->qty ?></td>
              <td><?= 'Rp. '.number_format($booking_item->subtotal, 0, ",", ".") ?></td>
            </tr>
            <?php endforeach ?>
          </tbody>
        </table>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
      <!-- accepted payments column -->
      <div class="col-6">
        <p class="lead">Metode Pembayaran</p>

        <p class="text-muted well well-sm shadow-none" style="margin-top: 10px;">
          <?= "$record->bank_name - $record->account_number" ?>
        </p>
      </div>
      <!-- /.col -->
      <div class="col-6">
        <div class="table-responsive">
          <table class="table">
            <tr>
              <th>Biaya Tambahan</th>
              <td><?= 'Rp. '.number_format($record->other_cost, 0, ",", ".") ?></td>
            </tr>
            <tr>
              <th style="width:50%">Total:</th>
              <td><?= 'Rp. '.number_format($subtotal, 0, ",", ".") ?></td>
            </tr>
          </table>
        </div>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- this row will not appear when printing -->
    <div class="row no-print">
      <div class="col-12">
        <a href="<?= base_url("booking?id=$record->id&print=true") ?>" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a>
        <?php if($record->booking_status == 'Menunggu Pembayaran' && $record->bank_account_id != 1) { ?>
        <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Submit
          Payment
        </button>
        <?php } ?>
      </div>
    </div>
  </section>
  <!-- /.content -->
</div>
<!-- ./wrapper -->
<!-- Page specific script -->
<script>
  window.addEventListener("load", window.print());
</script>
</body>
</html>
