	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshMinesOnBmMap
RefreshMinesOnBmMap: @ 0x08019A68
	push {r4, r5, lr}
	movs r0, #0
	bl GetTrap
	adds r2, r0, #0
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08019AAE
	ldr r5, _08019AB4 @ =0x0202E3DC
	ldr r4, _08019AB8 @ =0x0202E3F0
_08019A7C:
	ldrb r0, [r2, #2]
	cmp r0, #0xb
	bne _08019AA6
	ldr r0, [r5]
	ldrb r3, [r2, #1]
	lsls r1, r3, #2
	adds r0, r1, r0
	ldrb r3, [r2]
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019AA6
	ldr r0, [r4]
	adds r0, r1, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #2
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
_08019AA6:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _08019A7C
_08019AAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019AB4: .4byte 0x0202E3DC
_08019AB8: .4byte 0x0202E3F0
