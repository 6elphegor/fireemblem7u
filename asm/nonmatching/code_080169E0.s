	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWeaponLevelSpecialCharFromExp
GetWeaponLevelSpecialCharFromExp: @ 0x080169E0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, _08016A04 @ =0x081C3B38
	mov r0, sp
	movs r2, #7
	bl memcpy
	adds r0, r4, #0
	bl GetWeaponLevelFromExp
	add r0, sp
	ldrb r0, [r0]
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016A04: .4byte 0x081C3B38
