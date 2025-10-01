<div class="container-fluid">
    <h1 class="h3 mb-0 text-gray-800 font-weight-bold"><?= lang(line: "dashboard_assigned_tickets") ?></h1>
    <p class="mb-3"><?= lang(line: "technician_list_subtitle") ?></p>

    <div class="flash-data" data-flashdata="<?= $this->session->flashdata('status') ?>"></div>
    <div class="flash-data1" data-flashdata="<?= $this->session->flashdata('status1') ?>"></div>

    <!-- Datatable -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th><?= lang(line: "dashboard_table_number_tickets") ?></th>
                            <th><?= lang(line: "dashboard_table_tickets_priority") ?></th>
                            <th><?= lang(line: "dashboard_table_date") ?></th>
                            <th><?= lang(line: "dashboard_table_deadline") ?></th>
                            <th><?= lang(line: "dashboard_table_user") ?></th>
                            <th><?= lang(line: "dashboard_table_category") ?></th>
                            <th><?= lang(line: "dashboard_table_location") ?></th>
                            <th><?= lang(line: "dashboard_table_subject") ?></th>
                            <th><?= lang(line: "dashboard_table_action") ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1;
                        foreach ($approve as $row) { ?>
                            <tr>
                                <td><?= $no ?></td>
                                <td><a href="<?= site_url('ticket_teknisi/detail_approve/' . $row->id_ticket) ?>" class="font-weight-bold" title="Detail"><?= $row->id_ticket ?></a></td>
                                <td class="font-weight-bold" style="color: <?= $row->warna ?>; text-align: center"><?= $row->nama_prioritas ?></td>
                                <td><?= $row->tanggal ?></td>
                                <td><?= $row->deadline ?></td>
                                <td><?= $row->nama ?></td>
                                <td><?= $row->nama_kategori ?> (<?= $row->nama_sub_kategori ?>)</td>
                                <td><?= $row->lokasi ?></td>
                                <td><?= $row->problem_summary ?></td>
                                <td>
                                    <?php if ($row->status == 3) { ?>
                                        <a href="<?= site_url('ticket_teknisi/terima_tugas/' . $row->id_ticket) ?>" class="btn btn-success btn-circle btn-sm" title="Terima & Set Prioritas">
                                            <i class="fas fa-check"></i>
                                        </a>
                                        <!-- <a href="<?= site_url('ticket_teknisi/tolak_tugas/' . $row->id_ticket) ?>" class="btn tolak btn-danger btn-circle btn-sm" title="Tolak Tugas">
                                            <i class="fas fa-times"></i>
                                        </a> -->
                                    <?php } else if ($row->status == 5) { ?>
                                        <a href="<?= site_url('ticket_teknisi/approve/' . $row->id_ticket) ?>" class="btn btn-success btn-circle btn-sm process terima" title="Process Now">
                                            <i class="fas fa-check"></i>
                                        </a>
                                    <?php } ?>
                                </td>
                            </tr>
                        <?php $no++;
                        } ?>
                    </tbody>
                </table>
            </div>
            <br />
            <div class="alert alert-warning text-dark" role="alert">
                <h6 class="font-weight-bold">Informasi!</h6>
                <p class="mb-0" style="font-size: 14px;">
                    <?= lang(line: 'technician_information') ?>
                </p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    const flashData = $('.flash-data').data('flashdata');
    if (flashData) {
        Swal.fire(
            'Sukses!',
            'Tiket dalam status ' + flashData,
            'success'
        )
    }

    const flashData1 = $('.flash-data1').data('flashdata');
    if (flashData1) {
        Swal.fire(
            'Sukses!',
            'Tiket dalam status ' + flashData1,
            'success'
        )
    }

    $('.process').on('click', function(e) {
        e.preventDefault();
        const href = $(this).attr('href');

        Swal.fire({
            title: 'Apa kamu yakin?',
            text: "Tiket ini akan diproses",
            icon: 'info',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Process'
        }).then((result) => {
            if (result.value) {
                document.location.href = href;
            }
        })
    });

    $('.pending').on('click', function(e) {
        e.preventDefault();
        const href = $(this).attr('href');

        Swal.fire({
            title: 'Apa kamu yakin?',
            text: "Tiket ini akan dipending",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Pending'
        }).then((result) => {
            if (result.value) {
                document.location.href = href;
            }
        })
    });

    // Untuk menampilkan pesan sukses (misal: "Tiket Ditolak")
	const flashData = $('.flash-data').data('flashdata');
	if (flashData) {
		Swal.fire(
			'Sukses!',
			'Status tiket telah diubah menjadi ' + flashData,
			'success'
		)
	}

	// JAVASCRIPT UNTUK TOMBOL TERIMA
	$('.terima').on('click', function(e) {
		e.preventDefault();
		const href = $(this).attr('href');

		Swal.fire({
			title: 'Anda yakin?',
			text: "Anda akan menerima dan mengatur prioritas tiket ini.",
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Ya, Terima!',
            cancelButtonText: 'Batal'
		}).then((result) => {
			if (result.value) {
				document.location.href = href;
			}
		})
	});

	// JAVASCRIPT UNTUK TOMBOL TOLAK
	$('.tolak').on('click', function(e) {
		e.preventDefault();
		const href = $(this).attr('href');

		Swal.fire({
			title: 'Anda yakin?',
			text: "Tiket ini akan ditolak dan dikembalikan ke pengguna.",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#d33',
			cancelButtonColor: '#3085d6',
			confirmButtonText: 'Ya, Tolak!',
            cancelButtonText: 'Batal'
		}).then((result) => {
			if (result.value) {
				document.location.href = href;
			}
		})
	});
</script>

<script type="text/javascript">
	// Menampilkan pesan sukses setelah redirect (misalnya: "Tiket Ditolak")
	const flashData = $('.flash-data').data('flashdata');
	if (flashData) {
		Swal.fire(
			'Sukses!',
			'Status tiket telah diubah menjadi ' + flashData,
			'success'
		)
	}

	// JAVASCRIPT UNTUK TOMBOL TERIMA
	$('.terima').on('click', function(e) {
		e.preventDefault();
		const href = $(this).attr('href');
		Swal.fire({
			title: 'Anda yakin?',
			text: "Anda akan menerima dan mengatur prioritas tiket ini.",
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Ya, Terima!',
            cancelButtonText: 'Batal'
		}).then((result) => {
			if (result.value) {
				document.location.href = href;
			}
		});
	});

	// JAVASCRIPT UNTUK TOMBOL TOLAK
	$('.tolak').on('click', function(e) {
		e.preventDefault();
		const href = $(this).attr('href');
		Swal.fire({
			title: 'Anda yakin?',
			text: "Tiket ini akan ditolak.",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#d33',
			cancelButtonColor: '#3085d6',
			confirmButtonText: 'Ya, Tolak!',
            cancelButtonText: 'Batal'
		}).then((result) => {
			if (result.value) {
				document.location.href = href;
			}
		});
	});
</script>