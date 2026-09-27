	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A234
sub_0807A234: @ 0x0807A234
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r6, #0
	adds r4, r5, #1
	b _0807A266
_0807A242:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0807A264
	ldr r2, [r0]
	cmp r2, #0
	beq _0807A264
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807A264
	ldrb r2, [r2, #4]
	cmp r2, r7
	bne _0807A264
	adds r6, #1
_0807A264:
	adds r4, #1
_0807A266:
	adds r0, r5, #0
	adds r0, #0x40
	cmp r4, r0
	blt _0807A242
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
