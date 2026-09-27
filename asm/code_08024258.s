	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddBridgeToTargetList
TryAddBridgeToTargetList: @ 0x08024258
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024294 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0802428E
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_08078F24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802428E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	movs r3, #0
	bl EnlistTarget
_0802428E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024294: .4byte 0x0202E3E0
