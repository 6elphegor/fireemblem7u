	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08024EB8
sub_08024EB8: @ 0x08024EB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r2, r1, #0
	ldr r1, _08024F40 @ =0x08B93E58
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #5
	mov sb, r0
	lsrs r0, r2, #7
	movs r1, #1
	bics r1, r0
	movs r6, #0
	ldr r0, _08024F44 @ =0x08B93E44
	mov sl, r0
	movs r0, #0x80
	lsls r0, r0, #3
	add r0, sb
	ldr r2, _08024F48 @ =0x02033F14
	adds r4, r0, r2
	movs r3, #0x40
	mov r8, r3
	movs r7, #0
	lsls r5, r1, #7
_08024EF2:
	mov r1, sl
	ldr r0, [r1]
	adds r0, r0, r7
	lsls r1, r6, #0xd
	ldr r2, _08024F48 @ =0x02033F14
	add r2, sb
	adds r1, r1, r2
	movs r2, #0x10
	bl CpuFastSet
	mov r2, sl
	ldr r0, [r2]
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #6
	adds r4, r4, r3
	add r8, r5
	adds r7, r7, r5
	adds r6, #1
	cmp r6, #2
	ble _08024EF2
	ldr r0, _08024F40 @ =0x08B93E58
	ldr r2, [sp]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024F40: .4byte 0x08B93E58
_08024F44: .4byte 0x08B93E44
_08024F48: .4byte 0x02033F14
