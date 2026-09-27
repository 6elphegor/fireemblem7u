	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF69C
sub_080AF69C: @ 0x080AF69C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r0, #0xe0
	lsls r0, r0, #8
	mov sl, r0
	cmp r5, #0
	beq _080AF6C8
	movs r1, #0xf0
	lsls r1, r1, #8
	mov sl, r1
_080AF6C8:
	movs r4, #0
	ldr r6, _080AF758 @ =0x02022860
	movs r7, #0xf8
	lsls r7, r7, #2
	adds r3, r6, r7
	lsls r2, r5, #0x10
	movs r0, #0xf0
	lsls r0, r0, #1
	mov ip, r0
_080AF6DA:
	adds r0, r5, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt _080AF6E4
	lsrs r1, r2, #0x10
_080AF6E4:
	mov r7, ip
	adds r0, r1, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	strh r0, [r3]
	adds r3, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r4, #1
	cmp r4, #0xf
	ble _080AF6DA
	bl EnablePalSync
	movs r4, #0
	mov r1, r8
	lsls r0, r1, #5
	subs r0, #0x88
	ldr r6, _080AF75C @ =0x08CE60C8
	rsbs r5, r0, #0
_080AF70E:
	mov r0, sb
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AF730
	ldr r1, _080AF760 @ =0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	adds r5, #0x20
_080AF730:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble _080AF70E
	ldr r3, _080AF764 @ =0x08CE60E8
	mov r7, sl
	str r7, [sp]
	movs r0, #4
	movs r1, #0x90
	movs r2, #0x50
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF758: .4byte 0x02022860
_080AF75C: .4byte 0x08CE60C8
_080AF760: .4byte 0x000001FF
_080AF764: .4byte 0x08CE60E8
