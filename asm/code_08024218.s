	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddClosedDoorToTargetList
TryAddClosedDoorToTargetList: @ 0x08024218
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08024254 @ =0x0202E3E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0802424E
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	bl sub_08078F24
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802424E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x1e
	movs r3, #0
	bl EnlistTarget
_0802424E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024254: .4byte 0x0202E3E0
