	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080434EC
sub_080434EC: @ 0x080434EC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08043528 @ =0x00002586
	mov r0, sp
	strh r1, [r0]
	ldr r0, _0804352C @ =0x08B98B60
	movs r1, #0
	bl Proc_Start
	ldr r0, _08043530 @ =0x08B98B88
	adds r1, r4, #0
	bl Proc_Start
	ldr r0, _08043534 @ =0x08B98B38
	adds r1, r4, #0
	bl Proc_Start
	movs r1, #1
	rsbs r1, r1, #0
	mov r0, sp
	bl SioSend16
	bl SoundVSyncOn_rev01
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043528: .4byte 0x00002586
_0804352C: .4byte 0x08B98B60
_08043530: .4byte 0x08B98B88
_08043534: .4byte 0x08B98B38
