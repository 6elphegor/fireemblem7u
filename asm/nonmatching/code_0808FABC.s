	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808FABC
sub_0808FABC: @ 0x0808FABC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	adds r3, r2, #0
	subs r3, #0x38
	cmp r3, #0
	bge _0808FAD2
	movs r7, #0
	adds r6, r2, #0
	b _0808FAE8
_0808FAD2:
	adds r0, r2, #0
	adds r0, #0x38
	cmp r0, #0xf0
	ble _0808FAE2
	movs r7, #0xf
	adds r6, r2, #0
	subs r6, #0x78
	b _0808FAE8
_0808FAE2:
	asrs r7, r3, #3
	lsls r0, r7, #3
	subs r6, r2, r0
_0808FAE8:
	adds r3, r1, #0
	subs r3, #0x28
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, #0xa0
	ble _0808FAFA
	movs r5, #8
	subs r1, #0x40
	b _0808FB0A
_0808FAFA:
	adds r0, r3, #0
	cmp r0, #0
	bge _0808FB04
	adds r0, r1, #0
	subs r0, #0x21
_0808FB04:
	asrs r5, r0, #3
	lsls r0, r5, #3
	subs r1, r1, r0
_0808FB0A:
	mov r8, r1
	ldr r4, _0808FB50 @ =0x02022C68
	adds r0, r4, #0
	movs r1, #2
	adds r2, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #2
	adds r2, r5, #0
	bl PutNumberOrBlank
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	adds r2, r6, #0
	bl PutNumberOrBlank
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	mov r2, r8
	bl PutNumberOrBlank
	movs r0, #1
	bl EnableBgSync
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FB50: .4byte 0x02022C68
