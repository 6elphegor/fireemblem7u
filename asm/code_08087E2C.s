	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCgTextDimensions
GetCgTextDimensions: @ 0x08087E2C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r6, #0
	ldrb r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_08087E44:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _08087E66
	cmp r0, #4
	bge _08087E78
	cmp r0, #1
	beq _08087E7C
	cmp r0, #1
	bgt _08087E5C
	cmp r0, #0
	beq _08087E98
	b _08087E88
_08087E5C:
	cmp r0, #2
	beq _08087E78
	cmp r0, #3
	beq _08087E98
	b _08087E88
_08087E66:
	cmp r0, #0x19
	ble _08087E70
	cmp r0, #0x80
	beq _08087E84
	b _08087E88
_08087E70:
	cmp r0, #0x18
	bge _08087E98
	cmp r0, #0x16
	blt _08087E88
_08087E78:
	adds r4, #1
	b _08087E44
_08087E7C:
	adds r4, #1
	adds r5, #0x10
	movs r6, #0
	b _08087E44
_08087E84:
	adds r4, #2
	b _08087E44
_08087E88:
	adds r0, r4, #0
	mov r1, sp
	bl GetCharTextLen
	adds r4, r0, #0
	ldr r0, [sp]
	adds r6, r6, r0
	b _08087E44
_08087E98:
	mov r0, r8
	strb r6, [r0]
	strb r5, [r7]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
