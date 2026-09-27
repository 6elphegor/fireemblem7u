	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseChestKeyItem
CanUnitUseChestKeyItem: @ 0x08027354
	push {lr}
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r1, _08027384 @ =0x0202E3E0
	ldr r2, [r1]
	lsls r1, r3, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _08027388
	adds r0, r2, #0
	adds r1, r3, #0
	bl IsThereClosedDoorAt
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027388
	movs r0, #1
	b _0802738A
	.align 2, 0
_08027384: .4byte 0x0202E3E0
_08027388:
	movs r0, #0
_0802738A:
	pop {r1}
	bx r1
	.align 2, 0
