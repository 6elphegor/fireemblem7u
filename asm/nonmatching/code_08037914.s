	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsUnitEnemy
AiIsUnitEnemy: @ 0x08037914
	push {lr}
	adds r1, r0, #0
	ldr r0, _08037938 @ =0x03004690
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803793C
	movs r0, #1
	b _0803793E
	.align 2, 0
_08037938: .4byte 0x03004690
_0803793C:
	movs r0, #0
_0803793E:
	pop {r1}
	bx r1
	.align 2, 0
