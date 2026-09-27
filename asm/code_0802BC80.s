	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802BC80
sub_0802BC80: @ 0x0802BC80
	push {r4, r5, lr}
	ldr r2, _0802BCB4 @ =0x0203A518
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802BCAC
	ldr r4, _0802BCB8 @ =0x0202E3E0
	movs r3, #0
_0802BC8E:
	ldrb r0, [r2, #2]
	cmp r0, #0xc
	bne _0802BCA4
	ldr r0, [r4]
	ldrb r5, [r2, #1]
	lsls r1, r5, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldrb r1, [r2]
	adds r0, r1, r0
	strb r3, [r0]
_0802BCA4:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BC8E
_0802BCAC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802BCB4: .4byte 0x0203A518
_0802BCB8: .4byte 0x0202E3E0
