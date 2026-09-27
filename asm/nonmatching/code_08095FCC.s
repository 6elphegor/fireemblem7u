	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095FCC
sub_08095FCC: @ 0x08095FCC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetConvoyItemCount_
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r6, r0, #0
	ldr r4, _08096044 @ =0x02012B50
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	adds r4, #0x90
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	adds r7, r4, #0
	movs r4, #0
	cmp r5, #0x64
	beq _08096006
	cmp r6, #0
	bne _08096008
_08096006:
	movs r4, #1
_08096008:
	ldr r0, _08096048 @ =0x0000126E
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl Text_InsertDrawString
	ldr r5, _0809604C @ =0x02012BE0
	movs r4, #0
	cmp r6, #5
	bne _08096024
	movs r4, #1
_08096024:
	ldr r0, _08096050 @ =0x0000126F
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x40
	adds r2, r4, #0
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096044: .4byte 0x02012B50
_08096048: .4byte 0x0000126E
_0809604C: .4byte 0x02012BE0
_08096050: .4byte 0x0000126F
