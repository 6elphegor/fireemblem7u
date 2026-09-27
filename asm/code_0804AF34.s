	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804AF34
sub_0804AF34: @ 0x0804AF34
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x30]
	ldr r2, _0804AFA4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x60
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0804AF50
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _0804AF50
	str r0, [r4, #0x30]
_0804AF50:
	ldr r1, [r2]
	movs r0, #0x90
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _0804AF66
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0804AF66
	str r0, [r4, #0x30]
_0804AF66:
	ldr r0, [r4, #0x30]
	cmp r0, r3
	beq _0804AF9E
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0x10]
	cmp r2, #0
	beq _0804AF7C
	adds r0, r4, #0
	adds r1, r3, #0
	bl _call_via_r2
_0804AF7C:
	ldr r0, [r4, #0x2c]
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _0804AF8C
	ldr r1, [r4, #0x30]
	adds r0, r4, #0
	bl _call_via_r2
_0804AF8C:
	ldr r0, _0804AFA8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804AF9E
	ldr r0, _0804AFAC @ =0x00000387
	bl m4aSongNumStart
_0804AF9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AFA4: .4byte 0x08B857F8
_0804AFA8: .4byte 0x0202BBF8
_0804AFAC: .4byte 0x00000387
