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
        <!-- card -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title"><?= 'Buat '.$page_name; ?></h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Alamat</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <p>
                  <?= $this->session->userdata("address") ?>
                </p>
              </div>
            </div>
            <form action="<?= base_url("booking/update") ?>" method="POST" enctype="multipart/form-data">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Area</label>
                    <select name="product_id" class="form-control select2bs4" style="width: 100%;" required>
                      <option>--Pilih Area--</option>
                      <?php 
                      foreach ($areas as $data) {
                        echo '<option value="'.$data->id.'">'.$data->name.'</option>';
                      }
                      ?>
                    </select>
                  </div>
                  <div class="form-group">
                    <label>Keluhan</label>
                    <textarea name="complaint" class="form-control" required></textarea>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-md-6">
                   <div class="form-group">
                    <label>Tanggal</label>
                    <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
                        <input type="text" class="form-control datetimepicker-input" name="date" data-target="#reservationdatetime"/>
                        <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                        </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Metode pembayaran</label>
                    <select name="bank_aacount_id" class="form-control select2bs4" style="width: 100%;" required>
                      <option>--Pilih Rekening--</option>
                      <?php 
                      foreach ($bank_accounts as $data) {
                        echo '<option value="'.$data->id.'">'.$data->name.' - '.$data->account_number.'</option>';
                      }
                      ?>
                    </select>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <div class="row">
                <div class="col-md-12">
                  <button type="submit" class="btn btn-outline-primary">Tambah</button>
                </div>
              </div>
            </form>
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
          </div>
        </div>
        <!-- /.card -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->