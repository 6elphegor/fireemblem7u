	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxPopulateStatScreenStatus
HelpBoxPopulateStatScreenStatus: @ 0x08081580
	adds r2, r0, #0
	ldr r0, _0808159C @ =0x0200310C
	ldr r0, [r0, #0xc]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #8
	bhi _08081632
	lsls r0, r0, #2
	ldr r1, _080815A0 @ =_080815A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808159C: .4byte 0x0200310C
_080815A0: .4byte _080815A4
_080815A4: @ jump table
	.4byte _080815C8 @ case 0
	.4byte _080815D2 @ case 1
	.4byte _080815E0 @ case 2
	.4byte _080815EC @ case 3
	.4byte _080815F6 @ case 4
	.4byte _08081604 @ case 5
	.4byte _08081610 @ case 6
	.4byte _0808161C @ case 7
	.4byte _08081628 @ case 8
_080815C8:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9c
	lsls r0, r0, #2
	b _08081630
_080815D2:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _080815DC @ =0x00000271
	b _08081630
	.align 2, 0
_080815DC: .4byte 0x00000271
_080815E0:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _080815E8 @ =0x00000272
	b _08081630
	.align 2, 0
_080815E8: .4byte 0x00000272
_080815EC:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9d
	lsls r0, r0, #2
	b _08081630
_080815F6:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081600 @ =0x00000273
	b _08081630
	.align 2, 0
_08081600: .4byte 0x00000273
_08081604:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _0808160C @ =0x00000275
	b _08081630
	.align 2, 0
_0808160C: .4byte 0x00000275
_08081610:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081618 @ =0x00000276
	b _08081630
	.align 2, 0
_08081618: .4byte 0x00000276
_0808161C:
	adds r1, r2, #0
	adds r1, #0x4c
	ldr r0, _08081624 @ =0x00000277
	b _08081630
	.align 2, 0
_08081624: .4byte 0x00000277
_08081628:
	adds r1, r2, #0
	adds r1, #0x4c
	movs r0, #0x9e
	lsls r0, r0, #2
_08081630:
	strh r0, [r1]
_08081632:
	bx lr
