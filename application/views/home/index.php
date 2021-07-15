  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
      </div>
      <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <?php foreach ($records as $record) : ?>
                    <div class="col-md-3">
                      <div class="card">
                        <a href="<?= base_url("$record->url") ?>" class="p-3">
                          <img src="<?= base_url("$record->image_url") ?>" class="card-img-top" alt="<?= base_url("$record->image_url") ?>">
                        </a>
                        <div class="card-body">
                          <div class="row">
                            <div class="col-md-12">
                              <h5 class="card-title"><?= $record->name ?></h5>
                            </div>
                          </div>
                        </div>
                        <div class="card-footer">
                          <p class="card-text"><?= $record->description ?></p>
                        </div>
                      </div>
                      <br>
                    </div>
                  <?php endforeach ?>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->