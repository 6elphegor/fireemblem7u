	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5E80
sub_080B5E80: @ 0x080B5E80
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	ldr r0, _080B5F40 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	movs r2, #0x20
	bl CpuFastSet
	cmp r4, #1
	bne _080B5F58
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
	movs r3, #0
_080B5EAC:
	mov r0, sl
	adds r6, r0, r7
	mov r1, r8
	ands r6, r1
	movs r5, #0
	ldr r2, _080B5F44 @ =0x06001000
	adds r4, r3, r2
_080B5EBA:
	mov r1, sb
	adds r0, r1, r5
	mov r2, r8
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	lsls r0, r0, #5
	ldr r1, _080B5F48 @ =0x06008000
	adds r0, r0, r1
	adds r1, r4, #0
	movs r2, #8
	str r3, [sp]
	bl CpuFastSet
	adds r4, #0x20
	adds r5, #1
	ldr r3, [sp]
	cmp r5, #0x1d
	ble _080B5EBA
	movs r2, #0x80
	lsls r2, r2, #3
	adds r3, r3, r2
	adds r7, #1
	cmp r7, #0x13
	ble _080B5EAC
	movs r7, #0
	movs r5, #0x1f
	mov r8, r5
_080B5EF2:
	mov r1, sl
	adds r0, r1, r7
	mov r2, r8
	ands r0, r2
	movs r5, #0
	adds r4, r7, #1
	lsls r1, r7, #5
	mov ip, r1
	lsls r6, r0, #5
	lsls r0, r7, #6
	ldr r2, _080B5F4C @ =0x02023C60
	adds r3, r0, r2
_080B5F0A:
	mov r7, sb
	adds r0, r7, r5
	mov r1, r8
	ands r0, r1
	mov r7, ip
	adds r2, r7, r5
	adds r0, r6, r0
	lsls r0, r0, #1
	ldr r1, _080B5F50 @ =0x02024460
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #8
	ldrh r0, [r0]
	ands r1, r0
	adds r1, #0x80
	adds r2, r2, r1
	ldr r7, _080B5F54 @ =0xFFFF8000
	adds r2, r2, r7
	strh r2, [r3]
	adds r3, #2
	adds r5, #1
	cmp r5, #0x1d
	ble _080B5F0A
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B5EF2
	b _080B5F92
	.align 2, 0
_080B5F40: .4byte 0x02022860
_080B5F44: .4byte 0x06001000
_080B5F48: .4byte 0x06008000
_080B5F4C: .4byte 0x02023C60
_080B5F50: .4byte 0x02024460
_080B5F54: .4byte 0xFFFF8000
_080B5F58:
	ldr r0, _080B5FAC @ =0x06008000
	ldr r1, _080B5FB0 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	movs r7, #0
	ldr r0, _080B5FB4 @ =0x02023C60
	mov r8, r0
	ldr r6, _080B5FB8 @ =0x02024460
	ldr r1, _080B5FBC @ =0x00008080
	adds r3, r1, #0
_080B5F70:
	adds r4, r7, #1
	lsls r0, r7, #6
	adds r2, r0, r6
	mov r5, r8
	adds r1, r0, r5
	movs r5, #0x1d
_080B5F7C:
	ldrh r7, [r2]
	adds r0, r3, r7
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r5, #1
	cmp r5, #0
	bge _080B5F7C
	adds r7, r4, #0
	cmp r7, #0x13
	ble _080B5F70
_080B5F92:
	bl EnablePalSync
	movs r0, #4
	bl EnableBgSync
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5FAC: .4byte 0x06008000
_080B5FB0: .4byte 0x06001000
_080B5FB4: .4byte 0x02023C60
_080B5FB8: .4byte 0x02024460
_080B5FBC: .4byte 0x00008080
