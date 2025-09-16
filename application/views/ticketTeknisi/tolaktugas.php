<div class="container-fluid">
	<h1 class="h3 mb-3 text-gray-800 font-weight-bold"><?= lang(line:"refuse_title") ?> #<?= $detail['id_ticket'] ?></h1>

	<div class="card shadow mb-4">
		<div class="card-body">
			<!-- <form method="post" action="<?= site_url('ticket_teknisi/proses_tolak/' . $detail['id_ticket']) ?>" enctype="multipart/form-data"> -->
			<?php echo form_open('ticket_teknisi/proses_tolak/' . $detail['id_ticket']); ?>


			<div class="form-group">
				<label class="mb-1 font-weight-bold text-gray-800"><?= lang(line:"refuse_sender") ?></label>
				<input class="form-control" name="reciepent" readonly value="<?= $detail['email'] ?>">
			</div>

			<div class="form-group">
				<label class="mb-1 font-weight-bold text-gray-800"><?= lang(line:"refuse_subject") ?></label>
				<input class="form-control" name="subject" readonly value="<?= $detail['id_ticket'] ?>">
			</div>

			<div class="form-group">
				<h6 class="mb-2 font-weight-bold text-gray-800"><?= lang(line:"refuse_reason") ?></h6>
				<div class="alert alert-warning text-dark" role="alert">
					<p class="mb-0" style="font-size: 14px;">
						<i class="fas fa-exclamation-circle"></i><?= lang(line:"refuse_reason_placeholder") ?>
					</p>
				</div>
				<textarea name="message" class="form-control <?= (form_error('message') ? "is-invalid" : "") ?>" rows="8" id="desk"></textarea>
				<div class="invalid-feedback">
					<?= form_error('message'); ?>
				</div>
			</div>

			<button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> <?= lang(line:"refuse_sent") ?></button>
			<button type="button" class="btn btn-danger" onclick="window.location='<?= site_url('ticket_teknisi/index_approve') ?>'"><?= lang(line:"refuse_cancel") ?></button>
			<?php echo form_close(); ?>


			<!-- </form> -->
		</div>
	</div>
</div>