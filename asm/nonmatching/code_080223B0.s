	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuCommand_SelectNo
MenuCommand_SelectNo: @ 0x080223B0
	push {lr}
	movs r0, #0
	bl SetTextFont
	ldr r0, _080223DC @ =0x0200323C
	ldr r1, _080223E0 @ =0x02022CB6
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _080223E4 @ =0x0200373C
	ldr r1, _080223E8 @ =0x020234B6
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	movs r0, #3
	bl EnableBgSync
	movs r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0
_080223DC: .4byte 0x0200323C
_080223E0: .4byte 0x02022CB6
_080223E4: .4byte 0x0200373C
_080223E8: .4byte 0x020234B6
