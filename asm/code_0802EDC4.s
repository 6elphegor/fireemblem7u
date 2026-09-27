	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGetUpgradedWeapon
ArenaGetUpgradedWeapon: @ 0x0802EDC4
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, _0802EDDC @ =0x081C4044
	mov r0, sp
	movs r2, #0x1a
	bl memcpy
	mov r4, sp
	b _0802EE04
	.align 2, 0
_0802EDDC: .4byte 0x081C4044
_0802EDE0:
	adds r0, r5, #0
	bl GetItemIndex
	ldrb r1, [r4]
	cmp r0, r1
	bne _0802EE02
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802EDFE
	bl MakeNewItem
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _0802EE0A
_0802EDFE:
	adds r0, r5, #0
	b _0802EE0A
_0802EE02:
	adds r4, #1
_0802EE04:
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _0802EDE0
_0802EE0A:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
