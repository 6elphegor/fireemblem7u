	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031124
sub_08031124: @ 0x08031124
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #0
	bl StartBgmVolumeChange
	bl SyncUnitDeploymentState
	adds r0, r4, #0
	bl sub_080A4E0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
