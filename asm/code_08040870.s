	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040870
sub_08040870: @ 0x08040870
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080408A8 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _080408AC @ =0x08B98B60
	movs r1, #0
	bl Proc_Start
	ldr r0, _080408B0 @ =0x08B98B88
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, _080408B4 @ =0x08B98B38
	adds r1, r4, #0
	bl Proc_Start
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080408A8: .4byte 0x00002586
_080408AC: .4byte 0x08B98B60
_080408B0: .4byte 0x08B98B88
_080408B4: .4byte 0x08B98B38
