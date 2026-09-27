	.include "macro.inc"

	.syntax unified

	thumb_func_start AiLocationIsPillageTarget
AiLocationIsPillageTarget: @ 0x0803710C
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r2, _08037134 @ =0x0202E3E0
	ldr r2, [r2]
	lsrs r1, r1, #0x16
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x21
	beq _08037142
	cmp r0, #0x21
	bgt _08037138
	cmp r0, #3
	beq _08037150
	b _08037154
	.align 2, 0
_08037134: .4byte 0x0202E3E0
_08037138:
	cmp r0, #0x24
	beq _08037150
	cmp r0, #0x37
	bne _08037154
	b _08037150
_08037142:
	mov r0, sp
	bl AiGetChestUnlockItemSlot
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08037154
_08037150:
	movs r0, #1
	b _08037156
_08037154:
	movs r0, #0
_08037156:
	add sp, #4
	pop {r1}
	bx r1
