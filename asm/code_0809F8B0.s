	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809F8B0
sub_0809F8B0: @ 0x0809F8B0
	push {r4, lr}
	sub sp, #0x64
	adds r4, r0, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809F8E6
	mov r0, sp
	ldrb r3, [r0, #0x13]
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1b
	cmp r0, r4
	beq _0809F8E6
	mov r2, sp
	movs r0, #0x1f
	adds r1, r4, #0
	ands r1, r0
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x13]
	mov r0, sp
	bl WriteGlobalSaveInfo
_0809F8E6:
	adds r0, r4, #0
	bl SetLang
	add sp, #0x64
	pop {r4}
	pop {r0}
	bx r0
