	.include "macro.inc"

	.syntax unified

	thumb_func_start CharStoreAI
CharStoreAI: @ 0x08037350
	adds r3, r0, #0
	ldrb r0, [r1, #0xc]
	adds r2, r3, #0
	adds r2, #0x42
	strb r0, [r2]
	ldrb r2, [r1, #0xd]
	adds r0, r3, #0
	adds r0, #0x44
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x40
	ldr r0, _0803737C @ =0x0000FFF8
	ldrh r3, [r2]
	ands r0, r3
	ldrb r3, [r1, #0xe]
	orrs r0, r3
	ldrb r1, [r1, #0xf]
	lsls r1, r1, #8
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0803737C: .4byte 0x0000FFF8
