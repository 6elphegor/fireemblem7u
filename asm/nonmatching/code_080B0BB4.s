	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0BB4
sub_080B0BB4: @ 0x080B0BB4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x5c
	ldrb r1, [r2]
	adds r2, r1, #0
	lsls r1, r2, #1
	adds r0, #0x30
	adds r1, r0, r1
	ldrh r2, [r1]
	adds r0, r2, #0
	bl AddItemToConvoy
	ldr r0, [r7]
	bl sub_080B2020
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
