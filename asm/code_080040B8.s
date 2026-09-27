	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080040B8
sub_080040B8: @ 0x080040B8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	cmp r1, #0
	ble _080040E6
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	adds r0, r1, #0
	movs r1, #0
	bl StartBgm
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x66
	movs r0, #0
	ldrsh r2, [r1, r0]
	adds r0, r2, #0
	bl SetBgmVolume
	b _080040EE
_080040E6:
	ldr r0, [r7]
	movs r1, #0
	bl Proc_Goto
_080040EE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
