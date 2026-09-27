	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeIn_Loop
FadeIn_Loop: @ 0x080AA18C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	adds r1, r0, r1
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AA1B0
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #2
	subs r2, r0, r1
	b _080AA1B2
_080AA1B0:
	lsls r2, r1, #1
_080AA1B2:
	ldr r3, [r4, #0x34]
	adds r0, r2, #0
	adds r1, r2, #0
	bl WriteFadedPaletteFromArchive
	ldr r0, [r4, #0x2c]
	cmp r0, #0x80
	bne _080AA1C8
	adds r0, r4, #0
	bl Proc_Break
_080AA1C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
