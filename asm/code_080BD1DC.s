	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BD1DC
sub_080BD1DC: @ 0x080BD1DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x2c]
	ldr r4, [sp, #0x30]
	ldr r1, [sp, #0x34]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, _080BD228 @ =0x08CEF424
	bl Proc_Start
	movs r1, #0
	str r1, [r0, #0x30]
	str r5, [r0, #0x34]
	str r4, [r0, #0x2c]
	bl EnablePalSync
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080BD234
	lsls r0, r5, #5
	ldr r1, _080BD22C @ =0x02022860
	adds r0, r0, r1
	ldr r1, _080BD230 @ =0x020072C0
	movs r2, #8
	bl CpuFastSet
	b _080BD23E
	.align 2, 0
_080BD228: .4byte 0x08CEF424
_080BD22C: .4byte 0x02022860
_080BD230: .4byte 0x020072C0
_080BD234:
	ldr r1, _080BD2C0 @ =0x020072C0
	adds r0, r6, #0
	movs r2, #8
	bl CpuFastSet
_080BD23E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _080BD2DA
	movs r0, #0
	mov ip, r0
	ldr r0, _080BD2C0 @ =0x020072C0
	movs r1, #0x1f
	mov sl, r1
	mov r6, sl
	mov r5, r8
	ands r6, r5
	lsls r1, r6, #0xa
	str r1, [sp, #4]
	adds r7, r0, #0
	movs r5, #0x20
	adds r5, r5, r7
	mov sb, r5
_080BD262:
	ldr r0, [sp]
	mov r1, ip
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080BD2C4
	ldrh r2, [r7]
	movs r5, #0x1f
	mov r8, r5
	mov r3, sl
	ands r3, r2
	movs r4, #0xf8
	lsls r4, r4, #2
	adds r0, r4, #0
	ands r0, r2
	lsls r1, r6, #5
	adds r0, r0, r1
	str r0, [sp, #8]
	movs r1, #0xf8
	lsls r1, r1, #7
	adds r0, r1, #0
	ands r0, r2
	ldr r5, [sp, #4]
	adds r2, r0, r5
	adds r3, r3, r6
	cmp r3, #0x1f
	ble _080BD29C
	movs r3, #0x1f
_080BD29C:
	mov r0, r8
	ands r3, r0
	ldr r0, [sp, #8]
	cmp r0, r4
	ble _080BD2A8
	adds r0, r4, #0
_080BD2A8:
	ands r0, r4
	adds r3, r3, r0
	adds r0, r2, #0
	cmp r0, r1
	ble _080BD2B4
	adds r0, r1, #0
_080BD2B4:
	ands r0, r1
	adds r0, r3, r0
	mov r1, sb
	strh r0, [r1]
	b _080BD2C8
	.align 2, 0
_080BD2C0: .4byte 0x020072C0
_080BD2C4:
	ldrh r0, [r7]
	strh r0, [r7, #0x20]
_080BD2C8:
	adds r7, #2
	movs r5, #2
	add sb, r5
	movs r0, #1
	add ip, r0
	mov r1, ip
	cmp r1, #0xf
	ble _080BD262
	b _080BD2F8
_080BD2DA:
	ldr r4, _080BD308 @ =0x020072E0
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	lsls r1, r5, #5
	ldr r0, _080BD30C @ =0x02022860
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #8
	bl CpuFastSet
	bl EnablePalSync
_080BD2F8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD308: .4byte 0x020072E0
_080BD30C: .4byte 0x02022860
