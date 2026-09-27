	.include "macro.inc"

	.syntax unified

	thumb_func_start DialogBoxGetGlyphLen
DialogBoxGetGlyphLen: @ 0x08083798
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	movs r5, #0
	adds r4, r0, #0
	strb r5, [r6]
	movs r0, #1
	bl SetTextFontGlyphs
_080837AA:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _080837CC
	cmp r0, #4
	bge _080837E2
	cmp r0, #1
	beq _080837E6
	cmp r0, #1
	bgt _080837C2
	cmp r0, #0
	beq _08083800
	b _080837F0
_080837C2:
	cmp r0, #2
	beq _080837E2
	cmp r0, #3
	beq _08083800
	b _080837F0
_080837CC:
	cmp r0, #0x19
	ble _080837D6
	cmp r0, #0x80
	beq _080837EC
	b _080837F0
_080837D6:
	cmp r0, #0x18
	bge _080837E6
	cmp r0, #0x14
	bgt _080837F0
	cmp r0, #0x12
	blt _080837F0
_080837E2:
	adds r4, #1
	b _080837AA
_080837E6:
	adds r4, #1
	movs r5, #0
	b _080837AA
_080837EC:
	adds r4, #2
	b _080837AA
_080837F0:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r5, r5, r0
	b _080837AA
_08083800:
	adds r0, r5, #2
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
