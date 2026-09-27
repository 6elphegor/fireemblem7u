	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CC38
sub_0807CC38: @ 0x0807CC38
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl HasConvoyAccess_
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CC50
	ldr r0, _0807CC58 @ =0x08CA78DC
	adds r1, r4, #0
	bl Proc_StartBlocking
_0807CC50:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CC58: .4byte 0x08CA78DC
