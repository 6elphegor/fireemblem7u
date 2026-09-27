	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawTextGlyph
DrawTextGlyph: @ 0x080058B0
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _080058FC @ =0x02028D70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r5, #0
	bl _call_via_r1
	mov r8, r0
	movs r4, #7
	ldrb r0, [r5, #2]
	ands r4, r0
	mov r6, sb
	adds r6, #8
	ldrb r0, [r5, #3]
	bl GetColorLut
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl DrawGlyphRam
	ldrb r2, [r5, #2]
	mov r1, sb
	ldrb r1, [r1, #5]
	adds r0, r2, r1
	strb r0, [r5, #2]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080058FC: .4byte 0x02028D70
