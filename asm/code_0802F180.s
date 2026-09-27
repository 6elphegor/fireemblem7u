	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaSetFallbackWeaponForUnit
ArenaSetFallbackWeaponForUnit: @ 0x0802F180
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, _0802F1C0 @ =0x081C403C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802F1CA
	movs r1, #0
	ldr r2, [r5, #4]
_0802F1A4:
	adds r0, r2, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F1C4
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	bl MakeNewItem
	strh r0, [r4]
	b _0802F1CA
	.align 2, 0
_0802F1C0: .4byte 0x081C403C
_0802F1C4:
	adds r1, #1
	cmp r1, #7
	ble _0802F1A4
_0802F1CA:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
