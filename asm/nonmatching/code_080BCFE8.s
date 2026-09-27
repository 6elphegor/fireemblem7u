	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCFE8
sub_080BCFE8: @ 0x080BCFE8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov ip, r1
	adds r5, r3, #0
	lsls r2, r2, #5
	ldr r0, _080BD088 @ =0x02022860
	adds r7, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	subs r6, r0, r5
	movs r0, #0xf8
	lsls r0, r0, #7
	mov sl, r0
	movs r0, #0xf
	mov sb, r0
_080BD00E:
	mov r0, r8
	ldrh r4, [r0]
	movs r0, #0x1f
	ands r0, r4
	adds r2, r0, #0
	muls r2, r5, r2
	mov r0, ip
	ldrh r3, [r0]
	movs r0, #0x1f
	ands r0, r3
	muls r0, r6, r0
	adds r2, r2, r0
	asrs r2, r2, #8
	movs r0, #0x1f
	ands r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #8
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r1, r0
	adds r2, r2, r1
	mov r0, sl
	ands r0, r4
	adds r1, r0, #0
	muls r1, r5, r1
	mov r0, sl
	ands r0, r3
	muls r0, r6, r0
	adds r1, r1, r0
	asrs r1, r1, #8
	mov r0, sl
	ands r1, r0
	adds r2, r2, r1
	strh r2, [r7]
	adds r7, #2
	movs r0, #2
	add r8, r0
	add ip, r0
	subs r0, #3
	add sb, r0
	mov r0, sb
	cmp r0, #0
	bge _080BD00E
	bl EnablePalSync
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD088: .4byte 0x02022860
