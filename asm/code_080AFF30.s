	.include "macro.inc"

	.syntax unified

	thumb_func_start ClassInfoDisplay_ExecScript
ClassInfoDisplay_ExecScript: @ 0x080AFF30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r0, [r0]
	cmp r0, #8
	bhi _080AFFB6
	lsls r0, r0, #2
	ldr r1, _080AFF48 @ =_080AFF4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AFF48: .4byte _080AFF4C
_080AFF4C: @ jump table
	.4byte _080AFF70 @ case 0
	.4byte _080AFF7A @ case 1
	.4byte _080AFF84 @ case 2
	.4byte _080AFF90 @ case 3
	.4byte _080AFF9C @ case 4
	.4byte _080AFFB6 @ case 5
	.4byte _080AFFAC @ case 6
	.4byte _080AFF90 @ case 7
	.4byte _080AFFB6 @ case 8
_080AFF70:
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080AFFB6
_080AFF7A:
	ldr r0, _080AFF80 @ =0x02000040
	movs r1, #0
	b _080AFFA0
	.align 2, 0
_080AFF80: .4byte 0x02000040
_080AFF84:
	ldr r0, _080AFF8C @ =0x02000040
	movs r1, #1
	b _080AFFA0
	.align 2, 0
_080AFF8C: .4byte 0x02000040
_080AFF90:
	ldr r0, _080AFF98 @ =0x02000040
	bl sub_08054E5C
	b _080AFFB6
	.align 2, 0
_080AFF98: .4byte 0x02000040
_080AFF9C:
	ldr r0, _080AFFA8 @ =0x02000040
	movs r1, #2
_080AFFA0:
	strh r1, [r0, #0xa]
	bl sub_08054C8C
	b _080AFFB6
	.align 2, 0
_080AFFA8: .4byte 0x02000040
_080AFFAC:
	ldr r0, _080AFFC0 @ =0x02000040
	movs r1, #4
	strh r1, [r0, #0xa]
	bl sub_08054C8C
_080AFFB6:
	movs r0, #0
	strh r0, [r4, #0x2a]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AFFC0: .4byte 0x02000040
