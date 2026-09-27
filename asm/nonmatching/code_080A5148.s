	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5148
sub_080A5148: @ 0x080A5148
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	movs r0, #0x3f
	ands r5, r0
	movs r1, #0x20
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080A5168
	movs r0, #0x1f
	ands r0, r5
	subs r5, r1, r0
_080A5168:
	movs r0, #1
	mov ip, r0
	ldr r0, _080A520C @ =0x02000004
	movs r2, #0xf8
	lsls r2, r2, #7
	mov sb, r2
	subs r6, r1, r5
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r0, #0x22
	mov r8, r0
	movs r4, #0x1f
	mov sl, r4
_080A5182:
	mov r0, ip
	subs r0, #8
	cmp r0, #2
	bls _080A51EC
	movs r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r1, _080A5210 @ =0x02022860
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r2, r8
	ldrh r4, [r2]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	adds r3, r0, #0
	muls r3, r6, r3
	adds r0, r4, #0
	ands r0, r2
	muls r0, r5, r0
	adds r3, r3, r0
	asrs r3, r3, #5
	ands r3, r2
	adds r0, r1, #0
	ands r0, r7
	adds r2, r0, #0
	muls r2, r6, r2
	adds r0, r4, #0
	ands r0, r7
	muls r0, r5, r0
	adds r2, r2, r0
	asrs r2, r2, #5
	ands r2, r7
	mov r0, sl
	ands r1, r0
	muls r1, r6, r1
	ands r4, r0
	adds r0, r4, #0
	muls r0, r5, r0
	adds r1, r1, r0
	asrs r1, r1, #5
	movs r4, #0x1f
	ands r1, r4
	movs r0, #0x88
	lsls r0, r0, #1
	add r0, ip
	lsls r0, r0, #1
	ldr r4, _080A5210 @ =0x02022860
	adds r0, r0, r4
	orrs r3, r2
	orrs r1, r3
	strh r1, [r0]
_080A51EC:
	movs r0, #2
	add r8, r0
	movs r1, #1
	add ip, r1
	mov r2, ip
	cmp r2, #0xf
	ble _080A5182
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A520C: .4byte 0x02000004
_080A5210: .4byte 0x02022860
