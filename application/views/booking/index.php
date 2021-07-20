  <style type="text/css">
    #example1 tbody tr {  
      cursor: pointer;
    }
  </style>
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
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <a href="<?= base_url("request/add") ?>" class="btn btn-app bg-success" hidden>
            <i class="fas fa-plus"></i> Tambah
          </a>
        </div>
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Data <?= $page_name; ?></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-hover nowrap">
                  <thead>
                  <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Tipe</th>
                    <th>Customer</th>
                    <th>Area</th>
                    <th>Mekanik</th>
                    <th>Keluhan</th>
                    <th>Tanggal</th>
                    <th>Biaya Tambahan</th>
                    <th>Status</th>
                    <th>Rekening</th>
                  </tr>
                  </thead>
                  <tbody>
                    <?php $no = 1; ?>

                    <?php foreach ($records as $record) { ?>
                      <tr class="clickable-row" onclick="window.location='<?= base_url("booking?id=$record->id") ?>'" class="clickable-row">
                        <td><?= $no; ?></td>
                        <td><?= $record->id ?></td>
                        <td><?= ($record->type == 'booking') ? 'Servis' : 'Belanja' ?></td>
                        <td><?= $record->user_name ?></td>
                        <td><?= $record->area_name ?></td>
                        <td><?= $record->mechanic_name ?></td>
                        <td class="text-truncate" style="max-width: 150px;"><?= $record->complaint ?></td>
                        <td><?= $record->date ?></td>
                        <td><?= "Rp " . number_format($record->other_cost, 0, ",", ".") ?></td>
                        <td><?= $record->booking_status ?></td>
                        <td><?= "$record->bank_name - $record->account_number" ?></td>
                      </tr>
                      <?php $no++; } ?>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
      <div class="modal fade" id="modal-the-id">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">The Title</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="<?= base_url("home") ?>" method="POST" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>The Label</label>
                      <input type="number" class="form-control" name="the_label" required>
                    </div>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary btn-sm">The Button</button>
              </form>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Tutup</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->