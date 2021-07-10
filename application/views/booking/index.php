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
          <a href="<?= base_url("request/add") ?>" class="btn btn-app bg-success">
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
                <table id="example1" class="table table-bordered table-striped nowrap">
                  <thead>
                  <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Area</th>
                    <th>Mekanik</th>
                    <th>Keluhan</th>
                    <th>Tanggal</th>
                    <th>Biaya Tambahan</th>
                    <th>Status</th>
                    <th>Rekening</th>
                    <th>Aksi</th>
                  </tr>
                  </thead>
                  <tbody>
                    <?php $no = 1; ?>

                    <?php foreach ($records as $record) { ?>
                      <tr>
                        <td><?= $no; ?></td>
                        <td><?= $record->id ?></td>
                        <td><?= $record->user_name ?></td>
                        <td><?= $record->area_name ?></td>
                        <td><?= $record->mechanic_name ?></td>
                        <td><?= $record->complaint ?></td>
                        <td><?= $record->date ?></td>
                        <td><?= $record->other_cost ?></td>
                        <td><?= $record->booking_status ?></td>
                        <td><?= "$record->bank_name - $record->account_number" ?></td>
                        <td>
                          <a href="<?= base_url("booking/update?id=$record->id&booking_status=$record->next_booking_status") ?>" type="button" class="btn btn-outline-success btn-sm"><?= $record->next_booking_status_name ?></a>
                          <a href="<?= base_url("booking?id=$record->id") ?>" type="button" class="btn btn-outline-primary btn-sm">Detail</a>
                        </td>
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
      <div class="modal fade" id="modal-deposit">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Setor Uang</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form action="<?= base_url("request/update") ?>" method="POST" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>Uang yang harus disetorkan</label>
                      <input type="text" class="form-control" id="m_total_deposit" disabled>
                      <input type="hidden" class="form-control" name="request_status" value="deposited">
                      <input type="hidden" class="form-control" id="m_id" name="id">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                    <div class="form-group">
                      <label>Setorkan</label>
                      <input type="number" class="form-control" name="deposit" required>
                    </div>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary btn-sm">Setor</button>
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