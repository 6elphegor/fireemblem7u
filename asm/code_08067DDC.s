	.include "macro.inc"

	.syntax unified

	thumb_func_start GetEfxHpChangeType
GetEfxHpChangeType: @ 0x08067DDC
	push {lr}
	cmp r0, #0
	beq _08067E40
	bl GetItemIndex
	subs r0, #0x4a
	cmp r0, #0xe
	bhi _08067E40
	lsls r0, r0, #2
	ldr r1, _08067DF8 @ =_08067DFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08067DF8: .4byte _08067DFC
_08067DFC: @ jump table
	.4byte _08067E38 @ case 0
	.4byte _08067E38 @ case 1
	.4byte _08067E38 @ case 2
	.4byte _08067E38 @ case 3
	.4byte _08067E38 @ case 4
	.4byte _08067E38 @ case 5
	.4byte _08067E3C @ case 6
	.4byte _08067E3C @ case 7
	.4byte _08067E3C @ case 8
	.4byte _08067E40 @ case 9
	.4byte _08067E40 @ case 10
	.4byte _08067E40 @ case 11
	.4byte _08067E38 @ case 12
	.4byte _08067E40 @ case 13
	.4byte _08067E38 @ case 14
_08067E38:
	movs r0, #2
	b _08067E42
_08067E3C:
	movs r0, #1
	b _08067E42
_08067E40:
	movs r0, #0
_08067E42:
	pop {r1}
	bx r1
	.align 2, 0
