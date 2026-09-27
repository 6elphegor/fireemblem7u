	.include "macro.inc"

	.syntax unified

	thumb_func_start DecayTraps
DecayTraps: @ 0x0802C24C
	push {r4, lr}
	ldr r4, _0802C254 @ =0x0203A518
	b _0802C28E
	.align 2, 0
_0802C254: .4byte 0x0203A518
_0802C258:
	ldrb r0, [r4, #2]
	cmp r0, #0xa
	beq _0802C264
	cmp r0, #0xc
	beq _0802C278
	b _0802C28C
_0802C264:
	ldrb r0, [r4, #3]
	subs r0, #1
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C28C
	adds r0, r4, #0
	bl RemoveTrap
	b _0802C28A
_0802C278:
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C28C
	adds r0, r4, #0
	bl sub_0802C21C
_0802C28A:
	subs r4, #8
_0802C28C:
	adds r4, #8
_0802C28E:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802C258
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
