	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808460C
sub_0808460C: @ 0x0808460C
	push {r4, lr}
	ldr r4, _08084664 @ =0x0203E6F4
	adds r0, r4, #0
	bl SetTextFont
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08084668
	adds r0, r4, #0
	adds r0, #0x18
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x20
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x28
	bl SpriteText_DrawBackground
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08084686
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _08084686
	adds r0, r4, #0
	adds r0, #0x30
	bl SpriteText_DrawBackground
	adds r0, r4, #0
	adds r0, #0x38
	bl SpriteText_DrawBackground
	b _08084686
	.align 2, 0
_08084664: .4byte 0x0203E6F4
_08084668:
	movs r4, #0
	b _0808467A
_0808466C:
	lsls r0, r4, #3
	ldr r1, _080846A0 @ =0x0203E70C
	adds r0, r0, r1
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r4, #1
_0808467A:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0808466C
_08084686:
	ldr r0, _080846A4 @ =0x08CC2ACC
	bl Proc_EndEach
	ldr r0, _080846A8 @ =0x08CC2B6C
	bl Proc_EndEach
	movs r0, #0
	bl SetTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080846A0: .4byte 0x0203E70C
_080846A4: .4byte 0x08CC2ACC
_080846A8: .4byte 0x08CC2B6C
