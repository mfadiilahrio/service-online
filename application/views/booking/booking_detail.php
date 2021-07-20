  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1><?= $page_name; ?></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active"><?= $this->uri->segment(1); ?></li>
            </ol>
          </div>
        </div>
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <?php if($error != null or $error != '') { ?>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          <?= $error; ?>
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <?php } ?>
        <div class="row">
          <div class="col-12">
            <div class="callout callout-info">
              <h5><i class="fas fa-info"></i> Status pesanan: </h5>
              <?= $record->booking_status ?>
            </div>
            <!-- Main content -->
            <div class="invoice p-3 mb-3">
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
                    <strong><?= 'Service Online - '.$record->workshop_name ?></strong><br>
                    <?= $record->workshop_address.', '.$record->workshop_postal_code ?><br>
                    Phone: <?= $record->workshop_phone ?><br>
                  </address>
                </div>
                <!-- /.col -->
                <div class="col-sm-4 invoice-col">
                  Kepada
                  <address>
                    <strong><?= $record->user_name ?></strong><br>
                    <?= $record->address.', '.$record->postal_code ?><br>
                    Phone: <?= $record->phone ?><br>
                    Email: <?= $record->user_email ?>
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

                  <p class="text well well-sm shadow-none" style="margin-top: 10px;">
                    <strong><?= "$record->bank_name - $record->account_number" ?></strong>
                  </p>
                </div>
                <!-- /.col -->
                <div class="col-6">
                  <div class="table-responsive">
                    <table class="table">
                      <?php if($record->other_cost != null) : ?>
                      <tr>
                        <th>Biaya Tambahan</th>
                        <td><?= 'Rp. '.number_format($record->other_cost, 0, ",", ".") ?></td>
                      </tr>
                      <?php endif ?>
                      <?php if($record->other_cost_note != null && $record->other_cost_note != '') : ?>
                      <tr>
                        <th>Note Biaya Tambahan</th>
                        <td><?= $record->other_cost_note ?></td>
                      </tr>
                      <?php endif ?>
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
            </div>
            <!-- /.invoice -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->