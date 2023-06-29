function showConfirmationDialog(nftid) {
                            Swal.fire({
                                title: 'Confirmation',
                                text: 'Are you sure you want to deny this?',
                                icon: 'question',
                                showCancelButton: true,
                                confirmButtonText: 'Confirm',
                                cancelButtonText: 'Deny',
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    // If confirmed, perform the action
                                    window.location.href = 'deny?id=' + nftid;
                                } else if (result.dismiss === Swal.DismissReason.cancel) {
                                    // If denied
                                    // You can add additional actions or leave it empty if no action is needed
                                }
                            });
                        }