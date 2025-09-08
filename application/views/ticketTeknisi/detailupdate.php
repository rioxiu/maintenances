<script type="text/javascript" language="javascript">
	$(document).ready(function() {
		$('#progress').attr('disabled', true);
		$('#desk').on('keyup', function() {
			if ($(this).val().length > 0) {
				$('#progress').attr('disabled', false);
			} else {
				$('#progress').attr('disabled', true);
			}
		});
	});
</script>

<script language="javascript" type="text/javascript">
	$(document).ready(function() {
		$("#id_kategori").change(function() {
			var data = {
				id_kategori: $("#id_kategori").val()
			};
			$.ajax({
				type: "POST",
				url: "<?= site_url('select/select_sub') ?>",
				data: data,
				success: function(msg) {
					$('#div-order').html(msg);
				}
			});
		});

	});
</script>

<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between">
		<h1 class="h3 mb-3 text-gray-800 font-weight-bold"><?= $title; ?> #<?= $detail['id_ticket'] ?></h1>

		<a href="<?= site_url('ticket_teknisi/change_category/' . $detail['id_ticket']) ?>" class="btn btn-warning text-dark btn-icon-split change">
			<span class="icon text-dark">
				<i class="fas fa-edit"></i>
			</span>
			<span class="text">Ganti Kategori</span>
		</a>
	</div>

	<div class="flash-data" data-flashdata="<?= $this->session->flashdata('status') ?>"></div>

	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Update Progress</a>
		</li>
		<li class="nav-item" role="presentation">
			<a class="nav-link" id="detail-tab" data-toggle="tab" href="#detail" role="tab" aria-controls="detail" aria-selected="false">Detail Tiket</a>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			<div class="card shadow mb-4">
				<div class="card-body">
					<h5 class="mb-3 font-weight-bold text-dark">
						Form Update Progress
					</h5>
					<form method="post" action="<?= site_url('ticket_teknisi/update_progress/' . $detail['id_ticket']) ?>" enctype="multipart/form-data">
						<div class="form-group">
							<label class="mb-2 font-weight-bold text-primary">Deskripsi Pekerjaan <span class="text-danger small">*Required</span></label>
							<textarea name="desk" class="form-control <?= (form_error('desk') ? "is-invalid" : "") ?>" rows="8" id="desk"><?= set_value('desk'); ?></textarea>
							<div class="invalid-feedback">
								<?= form_error('desk'); ?>
							</div>
						</div>

						<div class="form-group mb-3">
							<label class="font-weight-bold text-primary">Progress <span class="text-danger small">*Required</span></label>
							<p class="mb-2 small text-muted">*Jelaskan Deskripsi Pekerjaan Anda terlebih dahulu sebelum memilih progress.</p>
							<select name="progress" class="form-control <?= (form_error('progress') ? "is-invalid" : "") ?>" id="progress">
								<?php for ($i = $detail['progress']; $i <= 100; $i += 10) { ?>
									<option value="<?= $i; ?>" <?php if ($i == set_value('progress')) echo "selected = 'selected'" ?>>Progress <?= $i; ?> %</option>
								<?php } ?>
							</select>
							<div class="invalid-feedback">
								<?= form_error('progress'); ?>
							</div>
						</div>

						<div class="form-group mb-4">
							<h6 class="mb-1 font-weight-bold text-primary">Lampiran (Media) <span class="text-danger small">*Required</span></h6>
							<p class="small">Maks. Size 25 MB. Format file: gif, jpg, png, or pdf.</p>
							<input type="file" name="fileupdate" class="<?= (form_error('fileupdate') ? "is-invalid" : "") ?>">
							<div class="invalid-feedback">
								<?= form_error('fileupdate'); ?>
							</div>
						</div>

						<div class="form-group mb-3">
							<label class="mb-2 font-weight-bold text-primary">Tanda Tangan</label>
							<div class="mb-2">
								<button type="button" class="btn btn-default btn-sm" id="undo"><i class="fa fa-undo"></i> Undo</button>
								<button type="button" class="btn btn-danger btn-sm" id="clear"><i class="fa fa-eraser"></i> Clear</button>
							</div>
							<button type="button" class="btn btn-success btn-sm mb-2" id="save-png"><i class="fas fa-file-signature"></i> Simpan Tanda Tangan <i class="fas fa-arrow-right"></i></button>
							<div class="row">
								<div class="col-md-4">
									<canvas id="signature-pad" class="signature-pad"></canvas>
								</div>
								<div class="col-md-8">
									<div id="tandatangan" class="signature-result">
										<?php if (set_value('signed')) : ?>
											<img src="<?= set_value('signed'); ?>" class="img-fluid">
										<?php endif; ?>
									</div>
									<textarea id="signed" name="signed" style="display:none"><?= set_value('signed'); ?></textarea>
								</div>
							</div>
							<div class="text-danger small">
								<?= form_error('signed'); ?>
							</div>
						</div>
						<br />
						<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Simpan</button>
						<button type="button" class="btn btn-danger" onclick="window.location='<?= site_url('ticket_teknisi/index_tugas') ?>'">Batal</button>
					</form>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="detail" role="tabpanel" aria-labelledby="detail-tab">
			<div class="card shadow mb-4">
				<div class="card-body">
					<div class="row">
						<div class="col-md-4">
							<h5 class="mb-3 font-weight-bold text-dark">
								Ticket Information
							</h5>
							<div class="card">
								<div class="card-body">
									<h6 class="m-0 text-primary">Pemohon</h6>
									<div class="font-weight-bold">
										<?= $detail['nama'] ?><br>
									</div>
									<hr>
									<h6 class="m-0 text-primary">Email</h6>
									<div class="font-weight-bold">
										<?= $detail['email'] ?><br>
									</div>
									<hr>
									<h6 class="m-0 text-primary">Telepon</h6>
									<div class="font-weight-bold">
										<?= $detail['telp'] ?><br>
									</div>
									<hr>
									<h6 class="m-0 text-primary">Departemen</h6>
									<div class="font-weight-bold">
										<?= $detail['nama_dept'] . " (" . $detail['nama_bagian_dept'] . ")" ?><br>
									</div>
									<hr>
									<h6 class="m-0 text-primary">Tanggal</h6>
									<div class="font-weight-bold">
										<?= $detail['tanggal'] ?><br>
									</div>
									<hr>
									<h6 class="m-0 text-primary">Lokasi</h6>
									<div class="font-weight-bold">
										<?= $detail['lokasi'] ?><br>
									</div>
									<hr>
									<h6 class="m-0 text-primary">Kategori</h6>
									<div class="font-weight-bold">
										<?= $detail['nama_kategori'] . " (" . $detail['nama_sub_kategori'] . ")" ?><br>
									</div>
									<hr>
									<h6 class="m-0 text-primary">Prioritas</h6>
									<div class="font-weight-bold">
										<?php if ($detail['id_prioritas'] == 0) { ?>
											Will be determined
										<?php } else { ?>
											<div style="color: <?= $detail['warna'] ?>">
												<i class="fas fa-exclamation-triangle"></i>
												<?= $detail['nama_prioritas'] ?> - <?= $detail['waktu_respon'] ?> Day
											</div>
										<?php } ?>
									</div>
									<hr>
									<h6 class="m-0text-primary">Progress <span class="float-right text-primary"><?= $detail['progress'] ?>%</span></h6>
									<div class="progress mb-4">
										<div class="progress-bar" role="progressbar" style="width: <?= $detail['progress'] ?>%" aria-valuenow="<?= $detail['progress'] ?>" aria-valuemin="0" aria-valuemax="100">
										</div>
									</div>
								</div>
							</div>

							<br />

							<h6 class="mb-2 font-weight-bold text-primary">Attachment</h6>
							<?php if (pathinfo($detail['filefoto'], PATHINFO_EXTENSION) == 'pdf') { ?>
								<a href="<?= base_url('uploads/' . $detail['filefoto']) ?>" class="btn btn-light btn-icon-split">
									<span class="icon text-gray-600">
										<i class="fas fa-file-pdf"></i>
									</span>
									<span class="text"><?= $detail['filefoto'] ?></span>
								</a>
							<?php } else { ?>
								<a data-fancybox="gallery" href="<?= base_url('uploads/' . $detail['filefoto']) ?>">
									<img src="<?= base_url('uploads/' . $detail['filefoto']) ?>" style="width:100%;max-width:300px">
								</a><br>
								Click image to zoom <i class="fas fa-search-plus"></i>
							<?php } ?>
						</div>
						<div class="col-md-8">
							<h5 class="mb-3 font-weight-bold text-dark">Sistem Pelacakan</h5>
							<?php $no = 1;
							foreach ($tracking as $row) { ?>
								<?php if ($no == 1) {
									$no++;
									$bgstatus = 'status-delivered';
								} else {
									$bgstatus = 'status-expired';
								} ?>
								<div class="tracking-item">
									<div class="tracking-icon status-intransit <?= $bgstatus; ?>" data-icon="circle">

									</div>
									<div class="tracking-date">
										<div class="font-weight-bold"><?= $row->tanggal ?></div>
									</div>
									<div class="tracking-content">
										<div class="font-weight-bold text-primary"><?= $row->status ?></div>
										<h4 class="small font-weight-bold">Oleh: <?= $row->nama ?></h4>
										<?php if ($row->filefoto != "") { ?>
											<?php if (pathinfo($row->filefoto, PATHINFO_EXTENSION) == 'pdf') { ?>
												<p><?= nl2br($row->deskripsi) ?></p>
												<a href="<?= base_url('files/teknisi/' . $row->filefoto) ?>" class="btn btn-light btn-icon-split">
													<span class="icon text-gray-600">
														<i class="fas fa-file-pdf"></i>
													</span>
													<span class="text"><?= $row->filefoto ?></span>
												</a>
											<?php } else { ?>
												<p><?= nl2br($row->deskripsi) ?></p>
												<a data-fancybox="gallery" href="<?= base_url('files/teknisi/' . $row->filefoto) ?>">
													<img src="<?= base_url('files/teknisi/' . $row->filefoto) ?>" style="width:100%;max-width:300px">
												</a><br>
												Click to zoom <i class="fas fa-search-plus"></i>
											<?php } ?>
										<?php } else {
											echo nl2br($row->deskripsi);
										} ?>
										<?php if ($row->signature != "") { ?>
											<hr />
											<p>Tanda Tangan</p>
											<img src="<?= base_url('files/teknisi/signature/' . $row->signature) ?>" style="width:100%;max-width:150px">
										<?php } ?>
									</div>
								</div>
							<?php $no++;
							} ?>

							<hr />

							<h5 class="mb-3 font-weight-bold text-dark"><?= " Diproses Oleh " . $detail['nama_teknisi'] ?></h5>
							<h6 class="font-weight-bold text-primary">Progress <span class="float-right text-primary"><?= $detail['progress'] ?>%</span></h6>
							<div class="progress mb-4">
								<div class="progress-bar" role="progressbar" style="width: <?= $detail['progress'] ?>%" aria-valuenow="<?= $detail['progress'] ?>" aria-valuemin="0" aria-valuemax="100">
								</div>
							</div>
							<hr>
							<h6 class="m-0 font-weight-bold text-primary">Tanggal Deadline</h6>
							<div class="font-weight-bold">
								<?php if ($detail['deadline'] == "0000-00-00 00:00:00") {
									echo "Belum diset";
								} else { ?>
									<?= $detail['deadline']; ?>
								<?php } ?><br>
							</div>
							<hr>
							<h6 class="m-0 font-weight-bold text-primary">Tanggal Proses</h6>
							<div class="font-weight-bold">
								<?php if ($detail['tanggal_proses'] == "0000-00-00 00:00:00") {
									echo "Belum dimulai";
								} else { ?>
									<?= $detail['tanggal_proses']; ?>
								<?php } ?><br>
							</div>
							<hr>
							<h6 class="m-0 font-weight-bold text-primary">Tanggal Selesai (Solved)</h6>
							<div class="font-weight-bold">
								<?php if ($detail['tanggal_solved'] == "0000-00-00 00:00:00") {
									echo "Belum selesai";
								} else { ?>
									<?= $detail['tanggal_solved']; ?>
								<?php } ?><br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	const flashData = $('.flash-data').data('flashdata');
	if (flashData) {
		Swal.fire({
			icon: 'error',
			title: 'Error',
			text: flashData,
			footer: ''
		})
	}

	$('.change').on('click', function(e) {
		e.preventDefault();
		const href = $(this).attr('href');

		Swal.fire({
			title: 'Apa kamu yakin?',
			text: "Tiket ini akan dikembalikan ke admin",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Continue'
		}).then((result) => {
			if (result.value) {
				document.location.href = href;
			}
		})
	});

	$('textarea').keypress(function(event) {
		if (event.which == 13) {
			event.preventDefault();
			var s = $(this).val();
			$(this).val(s + "\n");
		}
	});
</script>