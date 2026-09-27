	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonBg2ScrollExt_Loop
EkrDragonBg2ScrollExt_Loop: @ 0x08065C9C
	ldr r1, _08065CB0 @ =0x0201FB20
	ldr r0, [r1]
	cmp r0, #1
	bne _08065CBC
	movs r0, #0
	str r0, [r1]
	ldr r1, _08065CB4 @ =0x0201FB24
	ldr r0, _08065CB8 @ =0x0201FB2C
	b _08065CC4
	.align 2, 0
_08065CB0: .4byte 0x0201FB20
_08065CB4: .4byte 0x0201FB24
_08065CB8: .4byte 0x0201FB2C
_08065CBC:
	movs r0, #1
	str r0, [r1]
	ldr r1, _08065CD0 @ =0x0201FB24
	ldr r0, _08065CD4 @ =0x0201FC6C
_08065CC4:
	str r0, [r1]
	adds r0, r1, #0
	ldr r1, _08065CD8 @ =0x0201FB28
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_08065CD0: .4byte 0x0201FB24
_08065CD4: .4byte 0x0201FC6C
_08065CD8: .4byte 0x0201FB28
