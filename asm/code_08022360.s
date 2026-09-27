	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022360
sub_08022360: @ 0x08022360
	push {lr}
	ldr r0, _0802238C @ =0x02002774
	ldr r1, _08022390 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl InitTextFont
	ldr r0, _08022394 @ =0x02022CB6
	ldr r1, _08022398 @ =0x0200323C
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	ldr r0, _0802239C @ =0x020234B6
	ldr r1, _080223A0 @ =0x0200373C
	movs r2, #9
	movs r3, #0x13
	bl TmCopyRect_thm
	pop {r0}
	bx r0
	.align 2, 0
_0802238C: .4byte 0x02002774
_08022390: .4byte 0x06004000
_08022394: .4byte 0x02022CB6
_08022398: .4byte 0x0200323C
_0802239C: .4byte 0x020234B6
_080223A0: .4byte 0x0200373C
